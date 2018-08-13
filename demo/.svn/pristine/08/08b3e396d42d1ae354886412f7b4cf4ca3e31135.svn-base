<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <html xmlns="http://www.w3.org/1999/xhtml" >
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
<script>

    var strcodereturn; //return data of common code popup to check whether you change data of common code.
    var strdata; //data of common code popup
    var bdelete=false;
    var binit=true;
    var check="N";
    var strcode="";
    var obj_list_code; //temp list of common code list
    var v_language = "<%=Session("SESSION_LANG")%>";

    var flag_show = 1;

function BodyInit()
{
    System.Translate_V2(document, System.Menu.GetMenuPS());

    grdSearchRec.GetGridControl().ScrollTrack = true;
    txtIntroductionID.SetEnable(0);
    txtRequest.SetEnable(0);
    BindingDataList();
    OnProfile();
    OnShowHide();
    //dathrrc00200.StatusInsert();
}

function BindingDataList() {
    var data; 

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0021', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstBirthPlace.SetDataText(data);
    lstBirthPlace.value = " ";
    lstNCountryID.SetDataText(data);
    lstNCountryID.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0007', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstSEX.SetDataText(data);
    lstSEX.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0015', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstEthnic.SetDataText(data);
    lstEthnic.value = "02";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstNation.SetDataText(data);
    lstNation.value = "01";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0014', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstPlaceID.SetDataText(data);
    lstPlaceID.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0021', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstProvinceID.SetDataText(data);
    lstProvinceID.value = " ";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0011', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstEducation.SetDataText(data);
    lstEducation.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0147', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstGraKind.SetDataText(data);
    lstGraKind.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0143', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstLanguage.SetDataText(data);
    lstLanguage.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0144', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstLanguageSkill.SetDataText(data);
    lstLanguageSkill.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST2('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg_Code.SetDataText(data);
    lstOrg_Code.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstPosition.SetDataText(data);
    lstPosition.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0010', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstJob.SetDataText(data);
    lstJob.value = " ";

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstEmpType.SetDataText(data);
    lstEmpType.value = " ";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0159', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstPass.SetDataText(data);
    lstPass.value = "03";
	
}
//----------------------------------
function OnShowPopup(strtemp, objlist) {
    if (strtemp == 1) {


    }
    else if (strtemp == 2) {
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00700.aspx?";
        var obj = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes;');
        if (obj != null) {
            if (objlist == "0") {
                txtINT_PK.text = obj[0];
                txtIntroductionID.text = obj[1];
                txtIntroductionName.text = obj[2];

            }
            if (objlist == "1") {
                Interviewer1.text = obj[1] + " - " + obj[2];
                txtIntv1_PK.text = obj[0];
            }
            if (objlist == "2") {
                Interviewer2.text = obj[1] + " - " + obj[2];
                txtIntv2_PK.text = obj[0];
            }
            if (objlist == "3") {
                Interviewer3.text = obj[1] + " - " + obj[2];
                txtIntv3_PK.text = obj[0];
            }

        }
    }
    else if (strtemp == 3) {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj = window.showModalDialog(fpath, this, 'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:' + window.event.screenX + ';dialogTop:' + window.event.screenY + ';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj != null) {
            lstOrg_Code.value = obj;

        }
    }

    else if (strtemp == 4) {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/rc/hrrc00301.aspx";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes;');
        if (obj != null) {
            txtRequest_PK.text = obj[0];
            txtRequest.text = obj[1];
            lstOrg_Code.value = obj[2];
            lstPosition.value = obj[3];
			lstJob.value = obj[4];
			txtBasicSal.text= obj[5];

            //txtUpperOrg.text=obj;

            //datOrgData.Call();

        }
    }

    else if (strtemp == 6) {

    }
    else {
        var strcom;
        obj_list_code = objlist;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00500.aspx?code=" + strtemp;
        var strid = strtemp;

        var obj = System.OpenModal(fpath, 800, 600, 'resizable:yes;status:yes');

        if (obj != null) {
            strcodereturn = obj[1];
            txtComCodeID.text = strtemp;
            if (obj[0] == 1)  //modify common code
                datGetNewCode.Call("SELECT");

            else if (strcodereturn != 0) {

                obj_list_code.value = strcodereturn;
            }

        }
    }

}

function OnEnterRec() {
    datFindRec.Call();
}
function OnReset() {
    txtRec_PK.text = '';
    txtRequest_PK.text = '';
    txtRequest.text = '';
    txtID.text = '';
    txtFullName.text = '';
    lstSEX.value = '';
    lstNation.value = '01';
    txtPhoto_PK.text = '';
    txtBirthDT.text = '';
    lstBirthPlace.value = '';
    lstEthnic.value = '02';
    txtPersonalID.text = '';
    dtIssueDT.text = '';
    lstPlaceID.value = '';
    txtPerAdd.text = '';
    txtHomePhone.text = '';
    txtLivingAdd.text = '';
    txtTel.text = '';
    txtEmail.text = '';
    txtOtherContact.text = '';
    lstEducation.value = '';
    txtSchool.value = '';
    lstGraKind.value = '';
    txtDegree.text = '';
    lstLanguage.value = '';
    lstLanguageSkill.value = '';
    txtComputerSkill.text = '';
    txtareaReason.text = '';
    lstOrg_Code.value = '';
    lstPosition.value = '';
    lstJob.value = '';
    txtBasicSal.text = '';
    txtareaRequest.text = '';
    txtINT_PK.text = '';
    txtIntroductionID.text = '';
    txtIntroductionName.text = '';
    dtExpiryDT.text = '';

    lstProfile.value = '';
    txtareaNote.text = '';
    dtInterviewDT1.text = '';
    lstResult1.text = '';
    txtRemark1.text = '';
    dtInterviewDT2.text = '';
    lstResult2.text = '';
    txtRemark2.text = '';
    dtInterviewDT3.text = '';
    lstResult3.text = '';
    txtRemark3.text = '';
    lstPass.value = '';
    dtJoinDT.text = '';

    txtIntv1_PK.text = '';
    txtIntv2_PK.text = '';
    txtIntv3_PK.text = '';
    txtINT_PK.text = '';
    Interviewer1.text = '';
    Interviewer2.text = '';
    Interviewer3.text = '';
    lstMarital.value = '';
    txtMajor.text = '';
    lstProvinceID.value = '';
    lstNCountryID.value = '';

    txtSenior.text = '';
    txtPosition_Old.value = '';
    txtCompany.text = '';
    txtSalary_Old.text = '';
    txtProfile.text = '';
    txtITV1_Hours.text = '';
    txtITV2_Hours.text = '';
    txtITV3_Hours.text = '';

    dtReturnProfile.value = '';
    txtReasonReturn.text = '';

    ibtnDelete.SetEnable(true);
    imgFile.SetDataText(txtPhoto_PK.text);
    dathrrc00200.StatusInsert();
}
//--------------------------------------
function OnSearch() {
    var fpath = System.RootURL + "/form/ch/pr/chpr00010_search_emp.aspx?p_status=ALL&p_request=ALL";
    var obj = System.OpenModal(fpath, 950, 600, 'resizable:yes;status:yes;');
    if (obj != null) {
        txtRec_PK.text = obj[0];

        dathrrc00200.Call("SELECT");
    }
}
//--------------------------------------
function OnSearch_S() {
    datSearchRec.Call("SELECT");
}
//--------------------------------------
function OnDelete() {
    if (confirm("Do you want to delete ?.\n Bạn có muốn xóa không?")) {
        dathrrc00200.StatusDelete();
        dathrrc00200.Call();
    }
}
//----------------------------------
function checkKey() {
    var c = String.fromCharCode(event.keyCode);
    var x = c.toUpperCase().charCodeAt(0);
    event.keyCode = x;

}

function OnUpdate() 
{
    datCheck.Call();
}
function OnDataReceive(obj) {

    if (obj.id == "datGetNewCode") {
        var strcom;
        var ctllist;
        if (obj_list_code.value != "")
            strcom = obj_list_code.value;
        obj_list_code.SetDataText(txtCodeTemp.text);
        if (strcodereturn != 0)
            obj_list_code.value = strcodereturn;
        else
            obj_list_code.value = strcom;


    }
    if (obj.id == "datFindRec") {//alert(txtRec_PK.text +" - " +txtID.text)
        if (txtRec_PK.text == '') {
            alert("Can't find Candidate entry with ID " + txtID.text + "!\n Không tìm thấy thông tin tuyển dụng với ID " + txtID.text + ".");
            ibtnDelete.SetEnable(false);
        }
        else {
            ibtnDelete.SetEnable(true);
            //alert(txtRec_PK.text);
            dathrrc00200.StatusUpdate();
            dathrrc00200.Call("SELECT");
        }
    }
	
    if (obj.id == "datSearchRec_1") 
	{
		imgFile.SetDataText(txtPhoto_PK.text);
	}
    if (obj.id == "dathrrc00200") 
	{
        imgFile.SetDataText(txtPhoto_PK.text);
        OnProfile();
    }
    if (obj.id == "datCheckPerID") {
        var test = 0;
        if (txtTemp.text == '1') {
            alert("This Personnal ID " + txtPersonalID.text + " exist in Candidate data .\n Số CMND " + txtPersonalID.text + " này đã tồn tại trong thông tin tuyển dụng \nHave already person id of Candidate id: " + txtTemp1.text + "\nĐã trùng  với id tuyển dụng: " + txtTemp1.text);
            test = 1;
        }
        if (txtTemp.text == '2') {
            alert("This Personnal ID " + txtPersonalID.text + " exist in employee infomation .\n Số CMND " + txtPersonalID.text + " này đã tồn tại trong thông tin nhân viên \nHave already person id of employee id: " + txtTemp1.text + "\nĐã trùng ca với nhân viên: " + txtTemp1.text);
            test = 1;
        }
        if (txtTemp.text == '3') {
            alert("This Personnal ID " + txtPersonalID.text + " exist in employee infomation and Candidate data .\n Số CMND " + txtPersonalID.text + " này đã tồn tại trong thông tin nhân viên và hồ sơ tuyển dụng ")
            test = 1;
        }
        dathrrc00200.StatusUpdate();
        if (test == 1) 
		{
            if (confirm("Do you  want to continue?"))
			{
				dathrrc00200.Call();
			}  
        }
        else
            dathrrc00200.Call();
    }

    if (obj.id == "datCheck") {
        if (check == "Y") {
            if (txtFlag_Check.text == "Y1") {
                alert("Full name exist in block list\nHọ tên người này tồn tại trong danh sách từ chối!");
                check = "N";
            }
            else if (txtFlag_Check.text == "Y2") {
                alert("Birth Date exist in block list\nNgày sinh này tồn tại trong danh sách từ chối!");
                check = "N";
            }

            else if (txtFlag_Check.text == "Y3") {
                alert("Person ID exist in block list\nSố CMND này tồn tại trong danh sách từ chối!");
                check = "N";
            }
            else {
                alert("Person ID not exist in block list, you can continuous\nSố CMND này không tồn tại trong danh sách từ chối, bạn có thể tiếp tục!");
                check = "N";
            }

        }

        else {
            if (CheckInfo() == 1) 
			{
                txtPhoto_PK.text = imgFile.GetData();
                if (dathrrc00200.GetStatus() == '20')
                    if (confirm("Do you want to add new Candidate entry ?\nBạn có muốn thêm mới một thông tin tuyển dụng không ?")) 
					{
                        dathrrc00200.Call();
                    }
                if (dathrrc00200.GetStatus() == 10 || dathrrc00200.GetStatus() == 0)
                    if (confirm("Do you want to save ?\nBạn có muốn lưu lại không ?")) 
					{
                        CheckPerID()
                    }
            }
        }
    }

}

function CheckPerID() {
    if (txtPersonalID.text != '')
        datCheckPerID.Call();
}
function CheckInfo() {

    if (txtFullName.text == "") {
        alert("Please input full name date.\n Vui lòng nhập họ tên.");
        txtFullName.GetControl().focus();
        return 0;
    }
    if (txtBirthDT.text == "") {
        alert("Please input birth date.\n Vui lòng nhập ngày sinh.");
        txtBirthDT.GetControl().focus();
        return 0;
    }
    if (txtPersonalID.text == "") {
        alert("Please input personal ID.\n Vui lòng nhập số CMND.");
        txtPersonalID.GetControl().focus();
        return 0;
    }

    if (txtFlag_Check.text == "Y") {
        alert("Person ID exist in block list\nSố CMND này tồn tại trong danh sách từ chối!");
        txtPersonalID.GetControl().focus();
        return 0;
    }

    var t = CheckBirthDate();
    if (t == 1) {
        if (!confirm("Employee under 18!Do you want to continue? \n Nhân viên này chưa đủ 18tuổi, bạn muốn tiếp tục?"))

            return 0;
    }
    else if (t == 2) {
        alert("Year must be 4 character num, ex 1980,pls input again. \n Năm phải là 4 kí tự, ví dụ 1980, vui lòng nhập lại.");
        return 0;
    }
    else if (t == 3) {
        alert("Incorrect type, ex dd/mm/yyyy, pls input again \n Nhập ngày tháng năm không hợp lệ.");
        txtBirthDT.GetControl().focus();
        return 0;
    }
    else if (t == 4) {
        alert("Incorrect month, month >=1 and month <= 12, pls input again \n Kiểu tháng không hợp lệ.");
        txtBirthDT.GetControl().focus();
        return 0;
    }
    else if (t == 5) {
        alert("Incorrect day, day <= the last day of the month, pls input again\nSố ngày tối đa trong tháng không đúng.");
        txtBirthDT.GetControl().focus();
        return 0;
    }
    return 1;

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

function OnDataError(obj) {
    alert("Have error.Plase contact system admin.\n Hệ thống gặp lỗi vui lòng liên lạc admin");
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

function OnChangeTab2(val) {
    var tab_01 = document.all("tab_01");
    var tab_02 = document.all("tab_02");
    var r_01 = document.all("r_01");
    var r_02 = document.all("r_02");

    switch (val) {
        case '1':
            tab_01.style.display = "";
            tab_02.style.display = "none";
            r_01.src = "../../../../system/images/r_on.gif";
            r_02.src = "../../../../system/images/r_of.gif";
            break;

        case '2':
            tab_01.style.display = "none";
            tab_02.style.display = "";
            r_02.src = "../../../../system/images/r_on.gif";
            r_01.src = "../../../../system/images/r_of.gif";
            break;
    }
}

function OnResetIntro() {
    txtIntroductionID.text = "";
    txtIntroductionName.text = "";
}
//-----------------------------------------------
function Numbers(e) {
    //  var ctrl=idTEL.GetControl(); 
    var keynum;
    var keychar;
    var numcheck;
    keynum = event.keyCode;

    if (window.event) // IE 
    {
        keynum = e.keyCode;
    }
    else if (e.which) // Netscape/Firefox/Opera 
    {
        keynum = e.which;
    }
    keychar = String.fromCharCode(keynum);
    numcheck = /\d/;
    return numcheck.test(keychar);
}

function OnChangeDT(obj) {
    if (dtReceiveDT.value != '' && dtExpiryDT.value != '' && Number(dtReceiveDT.value) > Number(dtExpiryDT.value)) {
        alert("Please input Expiry date greater than Receive Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT1.value != '' && dtExpiryDT.value != '' && Number(dtInterviewDT1.value) > Number(dtExpiryDT.value)) {
        alert("Please input Expiry date greater than Interview Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT2.value != '' && dtExpiryDT.value != '' && Number(dtInterviewDT2.value) > Number(dtExpiryDT.value)) {
        alert("Please input Expiry date greater than Interview Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT3.value != '' && dtExpiryDT.value != '' && Number(dtInterviewDT3.value) > Number(dtExpiryDT.value)) {
        alert("Please input Expiry date greater than Interview Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT1.value != '' && dtReceiveDT.value != '' && Number(dtInterviewDT1.value) < Number(dtReceiveDT.value)) {
        alert("Please input Interview date greater than Receive Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT2.value != '' && dtReceiveDT.value != '' && Number(dtInterviewDT2.value) < Number(dtReceiveDT.value)) {
        alert("Please input Interview date greater than Receive Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT3.value != '' && dtReceiveDT.value != '' && Number(dtInterviewDT3.value) < Number(dtReceiveDT.value)) {
        alert("Please input Interview date greater than Receive Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT1.value != '' && dtInterviewDT2.value != '' && Number(dtInterviewDT2.value) < Number(dtInterviewDT1.value)) {
        alert("Please input Interview date 2 greater than Interview 1 Date ");
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT3.value != '' && dtInterviewDT2.value != '' && Number(dtInterviewDT3.value) < Number(dtInterviewDT2.value)) {
        alert("Please input Interview date 3 greater than Interview 2 Date ");
        obj.value = '';
        return 0;
    }
    if ((dtInterviewDT3.value != '' || dtInterviewDT2.value != '') && dtInterviewDT1.value == '') {
        alert("Please input Interview date 1 ");
        dtInterviewDT3.value = '';
        dtInterviewDT2.value = '';
        obj.value = '';
        return 0;
    }
    if (dtInterviewDT3.value != '' && dtInterviewDT2.value == '') {
        alert("Please input Interview date 2  ");
        obj.value = '';
        dtInterviewDT3.value = '';

        return 0;
    }


}
function CheckInput(obj, num) {
    if (num == '1' && dtInterviewDT1.value == '' && obj.text != '') {
        obj.text = '';
        alert("Please input Interview date 1 ");
    }
    if (num == '2' && dtInterviewDT2.value == '' && obj.text != '') {
        obj.text = '';
        alert("Please input Interview date 2 ");
    }
    if (num == '3' && dtInterviewDT3.value == '' && obj.text != '') {
        obj.text = '';
        alert("Please input Interview date 3 ");
    }
}
//---------------------------
function OnCheck() {
    check = "Y";
    datCheck.Call();
}

//------------------------
function OnProfile() {

    if (lstProfile.value == "N") {
        td1.style.display = "block";
        td2.style.display = "block";
        txtProfile.SetReadOnly(1);
    }
    else {
        td1.style.display = "none";
        td2.style.display = "none";
        txtProfile.SetReadOnly(1);
    }
}

function OnShowProfile() {

    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00800.aspx?code=HR0162&rec_pk=" + txtRec_PK.text;
    var obj = System.OpenModal(fpath, 800, 600, 'resizable:yes;status:yes');
    if (obj != null) {
        txtProfile.text = "";
        txtProfile_Code.text = "";
        var arrTemp;
        for (var i = 0; i < obj.length; i++) {

            arrTemp = obj[i];
            txtProfile_Code.text += arrTemp[3] + ",";
            txtProfile.text += arrTemp[12] + ",";
        }
        txtProfile.text = txtProfile.text.substr(0, txtProfile.text.length - 1);
        txtProfile_Code.text = txtProfile_Code.text.substr(0, txtProfile_Code.text.length - 1);

    }
}

function OnClear(obj) {
    obj.text = "";
}

function OnShowRec() {
    //alert(grdSearchEmp.GetGridData(grdSearchEmp.row, 0));
    var irow = grdSearchRec.row;

    txtRec_PK.text = grdSearchRec.GetGridData(irow, 0);
    //alert(txtEmp_PK.text);
    //datEmployee.Call("SELECT");
    datSearchRec_1.Call();
}
</script>

<body style=" margin-bottom:0; margin-top:0; margin-right:0; margin-left:0" >
<!------------------------------------>
<gw:data id="datCheck" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRC00200_0" > 
                <input>
                    <input bind="txtFullName" />  
                    <input bind="txtBirthDT" />  
                    <input bind="txtPersonalID" />  
                </input> 
                <output>
                    <output bind="txtFlag_Check" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datFindRec" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRC00200_1" > 
                <input>
                    <input bind="txtID" />                    
                </input> 
                <output>
                    <output bind="txtRec_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------>
<!------------------------------------->
<gw:data id="datCheckPerID" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRC00200_3" > 
                <input>
                    <input bind="txtRec_PK" />                    
                    <input bind="txtPersonalID" />                    
                </input> 
                <output>
                    <output bind="txtTemp" />
                    <output bind="txtTemp1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------------------------------->
<gw:data id="datGetNewCode" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="ST_HR_PRO_HRRC00200_2" > 
            <input> 
                <input bind="txtComCodeID" />
            </input>
	       <output>
	            <output bind="txtCodeTemp" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
<!-------------------------------------------->
<gw:data id="datSearchRec" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="grid"  function="ST_HR_SEL_HRRC00200_3" > 
            <input bind="grdSearchRec" >
                <input bind="txtID_S" />
            </input>
            <output  bind="grdSearchRec" />
        </dso> 
    </xml> 
</gw:data>

<!-------------------------------------------->
<gw:data id="datSearchRec_1" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_HRRC00200_4"> 
            <input>
                <input bind="txtRec_PK" /> 
            </input>
            <output>
                <output bind="txtID" /> 
                <output bind="txtFullName" /> 
                <output bind="lstSEX" /> 
                <output bind="lstNation" /> 
                <output bind="txtPhoto_PK" /> 
                
                <output bind="txtBirthDT" /> 
                <output bind="lstBirthPlace" /> 
                <output bind="lstEthnic" /> 
                <output bind="txtPersonalID" /> 
                <output bind="dtIssueDT" /> 
                
                <output bind="lstPlaceID" /> 
                <output bind="txtPerAdd" /> 
                <output bind="txtHomePhone" /> 
                <output bind="txtLivingAdd" /> 
                <output bind="txtTel" /> 
                
                <output bind="txtEmail" /> 
                <output bind="lstEducation" /> 
                <output bind="txtSchool" /> 
                <output bind="lstGraKind" /> 
                <output bind="txtDegree" /> 
                
                <output bind="lstLanguage" /> 
                <output bind="lstLanguageSkill" /> 
                <output bind="txtOtherLanguage" /> 
                <output bind="txtComputerSkill" />
                <output bind="txtareaReason" /> 
                
                <output bind="lstOrg_Code" /> 
                <output bind="lstPosition" /> 
                <output bind="lstJob" /> 
                <output bind="txtBasicSal" /> 
                <output bind="txtareaRequest" /> 
                
                <output bind="dtReceiveDT" />                     
                <output bind="txtINT_PK" /> 
                <output bind="txtIntroductionID" /> 
                <output bind="txtIntroductionName" /> 
                <output bind="dtExpiryDT" /> 
                
                <output bind="txtRequest_PK" /> 
                <output bind="lstProfile" /> 
                <output bind="txtareaNote" /> 
                <output bind="dtInterviewDT1" /> 
                <output bind="lstResult1" /> 
                
                <output bind="txtRemark1" /> 
                <output bind="dtInterviewDT2" /> 
                <output bind="lstResult2" /> 
                <output bind="txtRemark2" /> 
                <output bind="dtInterviewDT3" /> 
                
                <output bind="lstResult3" /> 
                <output bind="txtRemark3" /> 
                <output bind="lstPass" /> 
                <output bind="dtJoinDT" />     
                <output bind="txtSenior" />  
                
                <output bind="txtMajor" />   
                <output bind="txtRequest" />  
                <output bind="lstMarital" />
                <output bind="lstEmpType" />
                <output bind="Interviewer1" />
                
                <output bind="Interviewer2" />
                <output bind="Interviewer3" />
                <output bind="txtIntv1_PK" />
                <output bind="txtIntv2_PK" />
                <output bind="txtIntv3_PK" />

                <output bind="lstProvinceID" />
                <output bind="lstNCountryID" />
                <output bind="txtCompany" />
                <output bind="txtPosition_Old" />    
                <output bind="txtSalary_Old" />                          				
                    
                <output bind="txtProfile" />  
                <output bind="txtProfile_Code" />        
                <output bind="txtITV1_Hours" />  
                <output bind="txtITV2_Hours" />          
                <output bind="txtITV3_Hours" />
                    
                <output bind="dtReturnProfile" />
                <output bind="txtReasonReturn" />   
               
            </output> 
        </dso> 
    </xml> 
</gw:data>
<!------------------------------------>
<!------------------------------------>
<gw:data id="dathrrc00200" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,52,53,54 ,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72" 
                        function="ST_HR_SEL_HRRC00200_0" procedure="ST_HR_UPD_HRRC00200_0"> 
                <inout>
                    <inout bind="txtRec_PK" />
                    <inout bind="txtID" /> 
                    <inout bind="txtFullName" /> 
                    <inout bind="lstSEX" /> 
                    <inout bind="lstNation" /> 
                    
                    <inout bind="txtPhoto_PK" /> 
                    <inout bind="txtBirthDT" /> 
                    <inout bind="lstBirthPlace" /> 
                    <inout bind="lstEthnic" /> 
                    <inout bind="txtPersonalID" /> 
                    
                    <inout bind="dtIssueDT" /> 
                    <inout bind="lstPlaceID" /> 
                    <inout bind="txtPerAdd" /> 
                    <inout bind="txtHomePhone" /> 
                    <inout bind="txtLivingAdd" /> 
                    
                    <inout bind="txtTel" /> 
                    <inout bind="txtEmail" /> 
                    <inout bind="lstEducation" /> 
                    <inout bind="txtSchool" /> 
                    <inout bind="lstGraKind" /> 
                    
                    <inout bind="txtDegree" /> 
                    <inout bind="lstLanguage" /> 
                    <inout bind="lstLanguageSkill" /> 
                    <inout bind="txtOtherLanguage" /> 
                    <inout bind="txtComputerSkill" />
                    
                    <inout bind="txtareaReason" /> 
                    <inout bind="lstOrg_Code" /> 
                    <inout bind="lstPosition" /> 
                    <inout bind="lstJob" /> 
                    <inout bind="txtBasicSal" /> 
                    
                    <inout bind="txtareaRequest" /> 
                    <inout bind="dtReceiveDT" />                     
                    <inout bind="txtINT_PK" /> 
                    <inout bind="txtIntroductionID" /> 
                    <inout bind="txtIntroductionName" /> 
                    
                    <inout bind="dtExpiryDT" /> 
                    <inout bind="txtRequest_PK" />
                    <inout bind="lstProfile" /> 
                    <inout bind="txtareaNote" /> 
                    <inout bind="dtInterviewDT1" /> 
                    
                    <inout bind="lstResult1" /> 
                    <inout bind="txtRemark1" /> 
                    <inout bind="dtInterviewDT2" /> 
                    <inout bind="lstResult2" /> 
                    <inout bind="txtRemark2" /> 
                    
                    <inout bind="dtInterviewDT3" /> 
                    <inout bind="lstResult3" /> 
                    <inout bind="txtRemark3" /> 
                    <inout bind="lstPass" /> 
                    <inout bind="dtJoinDT" />     
                    
                    <inout bind="txtSenior" />  
                    <inout bind="txtMajor" />   
                    <inout bind="txtRequest" />  
                    <inout bind="lstMarital" />
                    <inout bind="lstEmpType" />
                    
                    <inout bind="Interviewer1" />
                    <inout bind="Interviewer2" />
                    <inout bind="Interviewer3" />
                    <inout bind="txtIntv1_PK" />
                    <inout bind="txtIntv2_PK" />
                    
                    <inout bind="txtIntv3_PK" />
                    <inout bind="lstProvinceID" />
                    <inout bind="lstNCountryID" />
                    <inout bind="txtCompany" />
                    <inout bind="txtPosition_Old" />    
                    
                    <inout bind="txtSalary_Old" />                          				
                    <inout bind="txtProfile" />  
                    <inout bind="txtProfile_Code" />        
                    <inout bind="txtITV1_Hours" />  
                    <inout bind="txtITV2_Hours" />          
                    
                    <inout bind="txtITV3_Hours" />
                    <inout bind="dtReturnProfile" />
                    <inout bind="txtReasonReturn" />                          				
               </inout> 
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------>
	<table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
		<tr> 
			<td id="left" style="width:25%;height:100%" valign="top" rowspan="2">
				<div style="width:100%;height:100%" class="eco_line">
					<table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
						<tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">Candidate ID</td>
                            <td align="left" style="width:70%"><gw:textbox id="txtID_S"  text="" 	maxlen = "10" styles='width:100%;' csstype="mandatory"  onenterkey="OnEnterRec()" /></td>
                            <td>&nbsp;</td>
                            <td><gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnSearch_S()"/></td>
                        </tr>
						<tr style="height: 96%" valign="top">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id='grdSearchRec'
                                    header='_Rec_pk|Candidate ID|Full Name|Pass YN|Start Working'
                                    format='0|0|0|0|0'
                                    aligns='0|0|0|0|0'
                                    defaults='|||||'
                                    editcol='0|0|0|0|0'
                                    widths='1000|1500|2000|1500|2000'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                    oncellclick="OnShowRec()"
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
                                <a class="eco_link" title="Click here to show/hide" onclick="OnShowHide()" href="#tips" style="text-decoration: none;" class="eco_link">Hide/Show Search</a>
                            </td>
							<td style="width:60%" align="center">
                                <table style="width:100%;height:100%;" border="0">
                                    <tr>
                                        <td style="width:40%" align="right">
                                           Candidate ID&nbsp;
										</td>
										<td style="width:60%" align="left">
                                            <gw:textbox id="txtID"  text="" 	maxlen = "15" styles='width:50%;' csstype="mandatory"  onenterkey="OnEnterRec()" />    
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
                                                <legend><font color="red" size="2"><b>Basic Information</b></font></legend>
                                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                                    <tr>
                                                        <td nowrap align="center" width=24% colspan=2  rowspan=4 >
                                                            <gw:image id="imgFile"  view="../../system/binary/ViewFile.aspx" post="../../system/binary/PostFile.aspx" styles="width:120;height:130"  />
														</td>
                                                        <td nowrap width=1%></td>
                                                        <td nowrap width="9%">Full Name(*)</td>
                                                        <td colspan="2" nowrap width=15%>
                                                            <gw:textbox id="txtFullName"  maxlen = "60" text="" styles='width:100%;' />
                                                        </td>
                                                        <td nowrap width="1%"></td>
                                                        <td nowrap width="9%">
															Sex
														</td>
                                                        <td nowrap width="15%"><gw:list  id="lstSEX" value=" " styles='width:100%' /></td>
                                                        <td nowrap width="1%"></td>
                                                        <td nowrap width="9%">
															Ethnic
														</td>
                                                        <td nowrap width="15%"><gw:list  id="lstEthnic" value="02" styles='width:100%' /></td>
                                                        <td nowrap width="1%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>
                                                        <td nowrap >Birth Date(*)</td>
                                                        <td colspan="2" nowrap width="15%">
                                                            <gw:textbox id="txtBirthDT"  text="" maxlen = "10" styles='width:100%' />
                                                        </td>
                                                        <td nowrap width="1%"></td>
                                                        <td nowrap width="9%">
                                                            <a class="eco_link" title="Click choose place birth" onclick="OnShowPopup('HR0021',lstBirthPlace)" href="#tips" style="text-decoration: none;" >Place Birth</a>
                                                        </td>
                                                        <td nowrap width="15%">
															<gw:list  id="lstBirthPlace" value=" "  maxlen = "100" styles='width:100%' /> 
                                                        </td> 
                                                        <td nowrap ></td>
                                                        <td nowrap >
                                                            <a class="eco_link" title="Click choose nation" onclick="OnShowPopup('HR0009',lstNation)" href="#tips" style="text-decoration: none;" >Nation(*)</a>
                                                        </td>
                                                        <td nowrap >
                                                            <gw:list  id="lstNation" value='01'  styles='width:100%' />
                                                        </td>
					                                    <td nowrap ></td>             
                                                    </tr>
													<tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap >
                                                            Personal ID
                                                        </td>
                                                        <td nowrap width="10%">
                                                            <gw:textbox id="txtPersonalID"  maxlen = "12" text="" styles='width:100%;' onkeypress="return Numbers(event)"  onlostfocus="check_number(0)" onenterkey="" />
                                                        </td>
                                                        <td nowrap width="5%"><gw:icon id="idBtnCheck" img="2" text="Check" styles='width:100%' onclick="OnCheck()" /></td>
                                                        <td nowrap ></td>
                                                        <td nowrap >
                                                            Issue Date
                                                        </td>
                                                        <td nowrap >
                                                            <gw:datebox id="dtIssueDT" text="" maxlen = "10" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept/>
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap >
                                                            <a class="eco_link" title="Click choose place ID" onclick="OnShowPopup('HR0014',lstPlaceID)" href="#tips" style="text-decoration: none;" >Place ID</a>
                                                        </td>
                                                        <td nowrap >
                                                            <gw:list  id="lstPlaceID" value=" " maxlen = "10" styles='width:100%' /> 
                                                        </td>
					                                    <td nowrap ></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>   
                                                        <td nowrap >Permanent Address</td>
                                                        <td colspan=5 nowrap ><gw:textbox id="txtPerAdd"  text="" maxlen = "100" styles='width:100%' /></td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Home Phone</td>
                                                        <td nowrap ><gw:textbox id="txtHomePhone"  text="" maxlen = "100" styles='width:100%' /> </td>
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
                                                        <td nowrap >
                                                            Current Address
                                                        </td>
                                                        <td nowrap colspan=5>
                                                            <gw:textbox id="txtLivingAdd"  text="" maxlen = "100" styles='width:100%' />   
                                                        </td>
                                                        <td nowrap></td>
                                                        <td nowrap >Hand Phone </td>
                                                        <td nowrap ><gw:textbox id="txtTel"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                                        </td> 
                                                        <td nowrap ></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr style="height:5%">
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
															<span style="font-weight:bold">Interview Information</span>
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
                                            <table id="tab_01" name="Extend Information 1" cellpadding="2" cellspacing="1" border="0" style="width:100%;height:100%" class="eco_line">
                                                <tr height="10%">
													<td nowrap width=1%></td>
													<td nowrap width=9%>Email</td>
													<td nowrap width=15%>
														<gw:textbox id="txtEmail"  text="" maxlen = "100" styles='width:100%' />
													</td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>Marital Status</td>
													<td nowrap width=15%><gw:list  id="lstMarital" value=" " maxlen = "10" styles='width:100%' > 
								                        <data>
									                        LIST|N|Single|Y|Married
								                        </data>
								                        </gw:list>
													</td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>
                                                        <a class="eco_link" title="Click here to show province id" onclick="OnShowPopup('HR0021',lstProvinceID)" href="#tips" style="text-decoration:none;" >Province</a>
													</td>
													<td nowrap width=15%>
                                                        <gw:list  id="lstProvinceID" value=" " maxlen = "10" styles='width:100%' />
													</td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>
                                                        <a class="eco_link" title="Click here to show NCountry id" onclick="OnShowPopup('HR0021',lstNCountryID)" href="#tips" style="text-decoration:none;" >N Country</a>
													</td>
													<td nowrap width=15%>
                                                        <gw:list  id="lstNCountryID" value=" " maxlen = "10" styles='width:100%' /> 
													</td>
												</tr>

                                                <tr height="10%">
													<td nowrap></td>
													<td nowrap>
                                                        <a class="eco_link" title="Click here to show education" onclick="OnShowPopup('HR0011',lstEducation)" href="#tips" style="text-decoration:none;" >Education</a>
													</td>
													<td nowrap>
                                                        <gw:list  id="lstEducation" value=" " maxlen = "10" styles='width:100%' /> 
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        Graduation School
													</td>
													<td nowrap>
                                                        <gw:textbox id="txtSchool"  text="" maxlen = "100" styles='width:100%' />
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        Major
													</td>
													<td nowrap>
                                                        <gw:textbox id="txtMajor"  text="" maxlen = "100" styles='width:100%' />
													</td>
													<td nowrap></td>
													<td >
                                                        <a class="eco_link" title="Click here to show result of education " onclick="OnShowPopup('HR0147',lstGraKind)" href="#tips" style="text-decoration:none;" >Result</a>
													</td>
													<td nowrap>
                                                        <gw:list  id="lstGraKind" value=" " maxlen = "10" styles='width:100%' /> 
													</td>
												</tr>
                                                <tr height="10%">
													<td nowrap></td>
													<td nowrap>
                                                        Other Certificate
													</td>
													<td nowrap>
                                                        <gw:textbox id="txtDegree"  text="" maxlen = "100" styles='width:100%' />
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        <a class="eco_link" title="Click here to show foreign language " onclick="OnShowPopup('HR0143',lstLanguage)" href="#tips" style="text-decoration:none;" >Foreign Language</a>
													</td>
													<td nowrap>
                                                        <gw:list  id="lstLanguage" value=" " maxlen = "10" styles='width:100%' /> 
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        <a class="eco_link" title="Click here to show language skill" onclick="OnShowPopup('HR0144',lstLanguageSkill)" href="#tips" style="text-decoration:none;" >Language Certificate</a>
													</td>
													<td nowrap>
                                                        <gw:list  id="lstLanguageSkill" value=" " maxlen = "10" styles='width:100%' /> 
													</td>
													<td nowrap></td>
													<td >
                                                        Other Language
													</td>
													<td nowrap>
                                                        <gw:textbox id="txtOtherLanguage"  text="" maxlen = "100" styles='width:100%' />
													</td>
												</tr>
                                                <tr height="10%">
													<td nowrap></td>
													<td nowrap>
                                                        Computer Skill
													</td>
													<td nowrap>
                                                        <gw:textbox id="txtComputerSkill"  text="" maxlen = "100" styles='width:100%' />
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        
													</td>
													<td nowrap>
                                                        
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        
													</td>
													<td nowrap>
                                                        
													</td>
													<td nowrap></td>
													<td >
                                                        
													</td>
													<td nowrap>
                                                        
													</td>
												</tr>
                                                <tr height="30%">
                                                    <td colspan=12 >
			                                            <fieldset style="height:60%"> <legend><font color="#e9361d" size="2" ><a title="Click here to show experience list" onclick="OnShowPopup('5','')" href="#tips" style="text-decoration:none;" >Experiences</a></font></legend>
				                                            <table width='100%' height="100%">
					                                            <tr>
                                                                    <td nowrap width=1%></td>
													                <td nowrap width=9%>
                                                                        Old Company
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:textbox id="txtCompany"  text="" maxlen="100" styles='width:100%' />
													                </td>
													                <td nowrap width=1%></td>
													                <td nowrap width=9%>
                                                                        Old Position
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:textbox id="txtPosition_Old"  text="" maxlen="100" styles='width:100%' />
													                </td>
													                <td nowrap width=1%></td>
													                <td nowrap rowspan="2" width=9%>
                                                                        Reason left
													                </td>
													                <td nowrap colspan="4" rowspan="2" width=40%>
                                                                        <gw:textarea id="txtareaReason" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea>
													                </td>
					                                            </tr>
					                                            <tr>
                                                                    <td nowrap></td>
													                <td nowrap>
                                                                        Old Salary
													                </td>
													                <td nowrap>
                                                                        <gw:textbox id="txtSalary_Old" onkeypress="return Numbers(event)" type="number" format="#,###,###,###.##"  text=" " styles='width:100%' />
													                </td>
													                <td nowrap></td>
													                <td nowrap>
                                                                        Seniority
													                </td>
													                <td nowrap>
                                                                        <gw:textbox id="txtSenior" maxlen=100  text="" styles='width:100%' />
													                </td>
						                                            
					                                            </tr>
				                                            </table>    
			                                            </fieldset>
		                                            </td>
                                                </tr>
                                                <tr height="30%">
	                                                <td colspan=12 align=center>
	                                                    <fieldset> <legend><font color="#e9361d" size="2" >Apply</font></legend>
		                                                    <table width='100%'>
			                                                    <tr>
                                                                    <td nowrap width=1%></td>
													                <td nowrap width=9%>
                                                                        <a class="eco_link" title="Click here to show request" onclick="OnShowPopup(4,'')" href="#tips" style="text-decoration:none;" >Candidate Request</a>
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:textbox  id="txtRequest"  text="" styles='width:100%'csstype="mandatory"  />
													                </td>
													                <td nowrap width=1%></td>
													                <td nowrap width=9%>
                                                                        Organization
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:list  id="lstOrg_Code" value=" " maxlen = "100" styles='width:100%' /> 
													                </td>
													                <td nowrap width=1%></td>
													                <td nowrap width=9%>
                                                                       Position
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:list  id="lstPosition" value=" " maxlen = "100" styles='width:100%' /> 
													                </td>
													                <td nowrap width=1%></td>
													                <td nowrap width=9%>
																		Job
													                </td>
													                <td nowrap width=15%>
                                                                        <gw:list  id="lstJob" value=" " styles='width:100%' /> 
													                </td>
					                                            </tr>
                                                                
                                                                <tr>
                                                                    <td nowrap></td>
													                <td nowrap>
                                                                        <a class="eco_link" title="Click here to show empployee type" onclick="OnShowPopup('HR0017',lstEmpType)" href="#tips" style="text-decoration:none;" >Employee Type</a>
													                </td>
													                <td nowrap>
                                                                        <gw:list  id="lstEmpType" styles='width:100%' /> 
													                </td>
													                <td nowrap></td>
													                <td nowrap>
                                                                        Salary
													                </td>
													                <td nowrap>
                                                                        <gw:textbox  id="txtBasicSal" type="number" format="#,###,###,###.##R" text="" styles='width:100%' />
													                </td>
						                                            <td nowrap></td>
													                <td nowrap>
                                                                        Other Request
													                </td>
													                <td nowrap colspan="4">
                                                                        <gw:textarea id="txtareaRequest" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea> 
													                </td>
					                                            </tr>
		                                                    </table>
	                                                    </fieldset>
	                                                </td>  
	                                            </tr>
                                            </table>
                                            <table id="tab_02" name="Extend Information 3" cellpadding="2" cellspacing="1" border="0" style="width:100%;height:100%;display:none" class="eco_line">
                                                <tr height="15%">
                                                    <td nowrap width=1%></td>
													<td nowrap width=9%>Receive Date</td>
													<td nowrap width=15%>
														<gw:datebox id="dtReceiveDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>"  onchange="OnChangeDT(this)" />
													</td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>
                                                        <a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'0')" href="#tips" >Introduction ID</a>
													</td>
													<td nowrap width=15%>
                                                        <gw:textbox  id="txtIntroductionID" text="" styles='width:100%' csstype="mandatory"  />
													</td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>Introduction Name</td>
													<td nowrap width=14%>
                                                        <gw:textbox  id="txtIntroductionName"  text="" styles='width:100%' csstype="mandatory"  />
													</td>
                                                    <td nowrap width=1%>
                                                        <gw:imgBtn id="ibtnResetIntro" alt="Reset Introduction" img="Reset" text="Reset" onclick="OnResetIntro()" />
                                                    </td>
													<td nowrap width=1%></td>
													<td nowrap width=9%>
                                                        Expiry Date
													</td>
													<td nowrap width=15%>
                                                        <gw:datebox id="dtExpiryDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
													</td>
                                                </tr>
                                                <tr height="15%">
                                                    <td nowrap></td>
													<td nowrap>
                                                        Full Profile
													</td>
													<td nowrap>
                                                        <gw:list  id="lstProfile" styles='width:100%' onchange="OnProfile()" >
								                            <data>
									                            |||Y|YES|N|NO
								                            </data>
								                        </gw:list> 
													</td>
													<td nowrap></td>
													<td id="td1" nowrap style="white-space:nowrap;display:none;">
                                                        <a class="eco_link" title="Click here to show minus profiles" onclick="OnShowProfile()" href="#tips" >Minus Profiles</a>
													</td>
													<td id="td2" nowrap style="white-space:nowrap;display:none;">
                                                        <gw:textbox id="txtProfile" maxlen=100 styles='width:100%'    />
													</td>
													<td nowrap></td>
													<td nowrap>
                                                        Note
													</td>
													<td nowrap colspan="5">
                                                        <gw:textarea id="txtareaNote" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea>
													</td>
													
                                                </tr>
                                                <tr height="70%">
			                                        <td colspan=13>
			                                            <fieldset style="height:80%"><legend><font color="#e9361d" size="2" >Interviewer</font></legend>
		                                                    <table width='100%' height="100%">
			                                                    <tr> 
                                                                    <td nowrap width=1%></td>
                                                                    <td nowrap width=9%>
                                                                        Interview DT1
                                                                    </td>
                                                                    <td nowrap width=10%>
                                                                        <gw:datebox id="dtInterviewDT1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
                                                                    </td>
                                                                    <td nowrap width=5%>
                                                                        <gw:textbox  id="txtITV1_Hours" text="-HH:MM-" styles='width:100%' onFocus="OnClear(txtITV1_Hours)"  />
                                                                    </td>
                                                                    <td nowrap width=1%></td>
                                                                    <td nowrap width=9%>
                                                                        <a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'1')" href="#tips" >Interviewer 1</a>
                                                                    </td>
                                                                    <td nowrap width=15%>
                                                                         <gw:textbox  id="Interviewer1" text="" styles='width:100%' csstype="mandatory"  />
                                                                    </td>
			                                                        <td nowrap width=1%></td>
                                                                    <td nowrap width=9%>Result 1</td>
                                                                    <td nowrap width=15%>
                                                                        <gw:list  id="lstResult1" styles='width:100%' value="03" >
								                                            <data>
									                                            <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
								                                            </data>
				                                                        </gw:list>
                                                                    </td>
                                                                    <td nowrap width=1%></td>
                                                                    <td nowrap width=9%>Remark 1</td>
                                                                    <td nowrap width=15%><gw:textbox  id="txtRemark1"  text="" styles='width:100%' onchange="CheckInput(this,1)"  /></td>
			                                                    </tr>
			                                                    <tr> 
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        Interview DT2
                                                                    </td>
                                                                    <td nowrap>
                                                                        <gw:datebox id="dtInterviewDT2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
                                                                    </td>
                                                                    <td nowrap>
                                                                        <gw:textbox  id="txtITV2_Hours" text="-HH:MM-" styles='width:100%' onFocus="OnClear(txtITV2_Hours)"  />
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        <a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'2')" href="#tips" >Interviewer 2</a>
                                                                    </td>
                                                                    <td nowrap>
                                                                         <gw:textbox  id="Interviewer2" text="" styles='width:100%' csstype="mandatory"  />
                                                                    </td>
			                                                        <td nowrap></td>
                                                                    <td nowrap>Result 2</td>
                                                                    <td nowrap>
                                                                        <gw:list  id="lstResult2" styles='width:100%' value="03" >
								                                            <data>
									                                            <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
								                                            </data>
				                                                        </gw:list>
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>Remark 2</td>
                                                                    <td nowrap><gw:textbox  id="txtRemark2"  text="" styles='width:100%' onchange="CheckInput(this,2)"  /></td>
                                                                </tr>
			                                                    <tr> 
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        Interview DT3
                                                                    </td>
                                                                    <td nowrap>
                                                                        <gw:datebox id="dtInterviewDT3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
                                                                    </td>
                                                                    <td nowrap>
                                                                        <gw:textbox  id="txtITV3_Hours" text="-HH:MM-" styles='width:100%' onFocus="OnClear(txtITV3_Hours)"  />
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        <a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'3')" href="#tips" >Interviewer 2</a>
                                                                    </td>
                                                                    <td nowrap>
                                                                         <gw:textbox  id="Interviewer3" text="" styles='width:100%' csstype="mandatory"  />
                                                                    </td>
			                                                        <td nowrap></td>
                                                                    <td nowrap>Result 3</td>
                                                                    <td nowrap>
                                                                        <gw:list  id="lstResult3" styles='width:100%' value="03" >
								                                            <data>
									                                            <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
								                                            </data>
				                                                        </gw:list>
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>Remark 3</td>
                                                                    <td nowrap><gw:textbox  id="txtRemark3"  text="" styles='width:100%' onchange="CheckInput(this,3)"  /></td>
                                                                </tr>
			                                                    <tr>
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        Status
                                                                    </td>
                                                                    <td nowrap colspan="2">
                                                                        <gw:list  id="lstPass" value='03' styles='width:100%' />
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>
                                                                        Start Working
                                                                    </td>
                                                                    <td nowrap>
                                                                         <gw:datebox id="dtJoinDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
                                                                    </td>
			                                                        <td nowrap></td>
                                                                    <td nowrap>Return DT</td>
                                                                    <td nowrap>
                                                                        <gw:datebox id="dtReturnProfile"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
                                                                    </td>
                                                                    <td nowrap></td>
                                                                    <td nowrap>Reason Return</td>
                                                                    <td nowrap><gw:textbox  id="txtReasonReturn"  text="" styles='width:100%'  /></td>
			                                                    </tr>
		                                                    </table>
	                                                    </fieldset>
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

	

 <gw:textbox id="txtComCodeID" styles="display:none"/>	
 <gw:textbox id="txtCodeTemp" styles="display:none" />
 <gw:textbox id="txtRec_PK" styles="display:none" />
 <gw:textbox id="txtINT_PK" styles="display:none" />
 <gw:textbox id="txtPhoto_PK" styles="display:none"/>
 <gw:textbox id="txtTemp" styles="display:none"/>
 <gw:textbox id="txtTemp1" styles="display:none"/>
 <gw:textbox  id="txtRequest_PK"  text="" styles="display:none" />
 <gw:textbox  id="txtIntv1_PK"  text="" styles="display:none" />
 <gw:textbox  id="txtIntv2_PK"  text="" styles="display:none" />
 <gw:textbox  id="txtIntv3_PK"  text="" styles="display:none" />
 <gw:textbox id="txtFlag_Check" styles="display:none"/>	
 <gw:textbox id="txtProfile_Code" styles="display:none"/>

 <gw:textbox id="txtOtherContact"  text=""  styles='width:100%;display:none'  /> 
</body>


