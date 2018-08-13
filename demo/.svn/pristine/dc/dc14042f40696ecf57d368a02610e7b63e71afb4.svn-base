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
var check="N";
var strcode="";
var obj_list_code; //temp list of common code list
var v_language = "<%=Session("SESSION_LANG")%>";
var lang= "<%=Session("Lang")%>"; 
var lang= "<%=Session("Lang")%>"; 

function BodyInit()
{          
    if (v_language!="ENG")
        System.Translate(document); 
      txtIntroductionID.SetEnable(0);
      txtRequest.SetEnable(0);
      Interviewer3.SetEnable(0);
      Interviewer2.SetEnable(0);
      Interviewer1.SetEnable(0);
   	 txtIntroductionName.SetEnable(0);

     OnProfile();
   	 datRec.StatusInsert();
}
function OnEnterRec()
{datFindRec.Call();
}
function OnReset()
{ txtRec_PK.text='';  
  txtRequest_PK.text='';
  txtRequest.text='';
  txtID.text='';
  txtFullName.text='';  
  lstSEX.value='';  
  lstNation.value='01';
  txtPhoto_PK.text='';
  txtBirthDT.text='';
  lstBirthPlace.value='';
  lstEthnic.value='09';
  txtPersonalID.text='';
  dtIssueDT.text='';
  lstPlaceID.value='';
  txtPerAdd.text='';                    
  txtHomePhone.text='';
  txtLivingAdd.text='';
  txtTel.text='';
  txtEmail.text='';
  txtOtherContact.text='';
  lstEducation.value='';
  txtSchool.value='';
  lstGraKind.value='';
  txtDegree.text='';
  lstLanguage.value='';
  lstLanguageSkill.value='';
  txtComputerSkill.text='';
  txtareaReason.text='';
  lstOrg_Code.value='';
  lstPosition.value='';
  lstJob.value='';
  txtBasicSal.text='';
  txtareaRequest.text='';
  txtINT_PK.text='';
  txtIntroductionID.text='';     
  txtIntroductionName.text='';   
  dtExpiryDT.text='';          
  
  lstProfile.value='';
  txtareaNote.text='';
  dtInterviewDT1.text='';                    
  lstResult1.text='';           
  txtRemark1.text='';                        
  dtInterviewDT2.text='';                    
  lstResult2.text='';           
  txtRemark2.text='';                        
  dtInterviewDT3.text='';                    
  lstResult3.text='';           
  txtRemark3.text='';            
  lstPass.value='' ;           
  dtJoinDT.text='';
  
  txtIntv1_PK.text='';
  txtIntv2_PK.text='';
  txtIntv3_PK.text='';
  txtINT_PK.text='';
  Interviewer1.text='';
  Interviewer2.text='';
  Interviewer3.text='';
  txtHeight.text='';
  txtWeight.text='';
  txtHealth.text='';
  lstMarital.value='';
  txtMajor.text = '';
  lstProvinceID.value = '';
  lstNCountryID.value = '';

  txtSenior.text = '';
  txtPosition_Old.value = '';
  txtCompany.text = '';
  txtSalary_Old.text = '';
  txtProfile.text ='';
  txtITV1_Hours.text = '';
  txtITV2_Hours.text = '';                  
  txtITV3_Hours.text = '';

  dtReturnProfile.value ='';
  txtReasonReturn.text ='';
                    
  ibtnDelete.SetEnable(true);
  imgFile.SetDataText(txtPhoto_PK.text);
  datRec.StatusInsert();
}
//--------------------------------------
function OnSearch()
{
    var fpath = System.RootURL + "/form/ch/pr/chpr00010_search_emp.aspx?p_status=ALL&p_request=ALL" ;
    var obj  = System.OpenModal(  fpath , 950 ,600, 'resizable:yes;status:yes;');
	if (obj!=null)
	{
	    txtRec_PK.text=obj[0];
	   
	    datRec.Call("SELECT");
	}
}
//--------------------------------------
function OnDelete()
{if(confirm ("Do you want to delete ?.\n Bạn có muốn xóa không?"))
    {datRec.StatusDelete();
     datRec.Call();
    }
}
//----------------------------------
function checkKey() 
{ 
	var c = String.fromCharCode (event.keyCode); 
	var x = c.toUpperCase().charCodeAt(0) ; 
	event.keyCode = x; 
	
}
//----------------------------------
function OnShowPopup(strtemp,objlist)
{
    if (strtemp==1 )
    {
            
     
    }
   	else if (strtemp==2)
   	{
   	 var fpath = System.RootURL + "/standard/forms/hr/co/hrco00700.aspx?" ;
     var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	 if (obj!=null)
	    {   if(objlist=="0")
	        {
                txtINT_PK.text = obj[0];
                txtIntroductionID.text=obj[1];
	            txtIntroductionName.text=obj[2]; 
                
	        }
	        if(objlist=="1")
	        {Interviewer1.text=obj[1]+" - " + obj[2];
	         txtIntv1_PK.text=obj[0];
	        }
	        if(objlist=="2")
	        {Interviewer2.text=obj[1]+" - " + obj[2];
	         txtIntv2_PK.text=obj[0];
	        }
	        if(objlist=="3")
	        {Interviewer3.text=obj[1]+" - " + obj[2];
	         txtIntv3_PK.text=obj[0];
	        }
	        
	    }
   	}
   	else if (strtemp==3)
    {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			lstOrg_Code.value = obj;
            
        }
    }
    
    	else if (strtemp==4)
    {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/re/hrre00101.aspx";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
        if (obj!=null)
        {
			txtRequest_PK.text = obj[0];
			txtRequest.text = obj[1];
			lstOrg_Code.value=obj[2];
			lstPosition.value=obj[3];
            //txtUpperOrg.text=obj;
            
            //datOrgData.Call();
            
        }
    }
    
    else if(strtemp==6)
    {
        
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
	        txtComCodeID.text= strtemp;
	        if (obj[0]==1 )  //modify common code
	            datGetNewCode.Call("SELECT");
	        
	        else if (strcodereturn!=0)
	        {
	            
                obj_list_code.value=strcodereturn;
	        }
	        
	    }
    }
    
}
function OnUpdate()
{ 
  datCheck.Call();
}
function OnDataReceive(obj)
{

    if (obj.id=="datGetNewCode")
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
   if (obj.id=="datFindRec")
   {//alert(txtRec_PK.text +" - " +txtID.text)
   if(txtRec_PK.text=='')
      {  
       alert("Can't find recruitment entry with ID "+txtID.text+"!\n Không tìm thấy thông tin tuyển dụng với ID "+txtID.text+".");
         ibtnDelete.SetEnable(false);
      }
    else    
    { ibtnDelete.SetEnable(true);
      //alert(txtRec_PK.text);
      datRec.StatusUpdate();
      datRec.Call("SELECT");
     }
   }
   if (obj.id=="datRec")
   {
    imgFile.SetDataText(txtPhoto_PK.text);
    OnProfile();
   }
   if (obj.id=="datCheckPerID")
   {var test=0;
    if(txtTemp.text=='1')
        {alert("This Personnal ID "+txtPersonalID.text+" exist in recruitment data .\n Số CMND "+txtPersonalID.text+" này đã tồn tại trong thông tin tuyển dụng \nHave already person id of recruitment id: " + txtTemp1.text+"\nĐã trùng  với id tuyển dụng: "+txtTemp1.text);
        test=1;
        }
     if(txtTemp.text=='2')
        {alert("This Personnal ID "+txtPersonalID.text+" exist in employee infomation .\n Số CMND "+txtPersonalID.text+" này đã tồn tại trong thông tin nhân viên \nHave already person id of employee id: " + txtTemp1.text+"\nĐã trùng ca với nhân viên: "+txtTemp1.text);
        test=1;
        }
     if(txtTemp.text=='3')
        {alert("This Personnal ID "+txtPersonalID.text+" exist in employee infomation and recruitment data .\n Số CMND "+txtPersonalID.text+" này đã tồn tại trong thông tin nhân viên và hồ sơ tuyển dụng ")
        test=1;
        }
        if(test==1)
          {if(confirm("Do you  want to continue."))
            datRec.Call();
          }
            else datRec.Call();
   }
   if(obj.id == "datCheck")
   {
      if(check == "Y")
      {
           if(txtFlag_Check.text == "Y1")
           {
                alert("Full name exist in block list\nHọ tên người này tồn tại trong danh sách từ chối!");
                check = "N";
           }
           else if(txtFlag_Check.text == "Y2")
           {
                alert("Birth Date exist in block list\nNgày sinh này tồn tại trong danh sách từ chối!");
                check = "N";
           }
           
           else if(txtFlag_Check.text == "Y3")
           {
                alert("Person ID exist in block list\nSố CMND này tồn tại trong danh sách từ chối!");
                check = "N";
           }
           else 
           {
                 alert("Person ID not exist in block list, you can continuous\nSố CMND này không tồn tại trong danh sách từ chối, bạn có thể tiếp tục!");
                 check = "N";
           }
        
      }

      else 
      {
            if(CheckInfo()==1)
            {
                txtPhoto_PK.text=imgFile.GetData();
            if(datRec.GetStatus()=='20')
               if(confirm("Do you want to add new recruitment entry ?.\n Bạn có muốn thêm mới một thông tin tuyển dụng không ?"))
                {   
                    datRec.Call();
                }
            if (datRec.GetStatus()==10 || datRec.GetStatus()==0)    
                if(confirm("Do you want to save ?.\n Bạn có muốn lưu lại không ?"))
                 {
                      CheckPerID()
                 }
            }    
      }
   }
   
}
function CheckPerID()
{ if(txtPersonalID.text!='') 
  datCheckPerID.Call();
}
function CheckInfo()
{ 
    
    if(txtFullName.text=="")
        {alert ("Please input full name date.\n Vui lòng nhập họ tên.");
                txtFullName.GetControl().focus();
            return 0;
        }
   if(txtBirthDT.text=="")
        {alert ("Please input birth date.\n Vui lòng nhập ngày sinh.");
            txtBirthDT.GetControl().focus();
            return 0;
        }
    if(txtPersonalID.text=="")
        {alert ("Please input personal ID.\n Vui lòng nhập số CMND.");
            txtPersonalID.GetControl().focus();
            return 0;
        }
    
    if(txtFlag_Check.text == "Y")
    {
        alert("Person ID exist in block list\nSố CMND này tồn tại trong danh sách từ chối!");
        txtPersonalID.GetControl().focus();
        return 0;
    }  
   
  var t=CheckBirthDate();
  if (t==1)
	{
		if (!confirm("Employee under 18!Do you want to continue? \n Nhân viên này chưa đủ 18tuổi, bạn muốn tiếp tục?"))
		
		    return 0;
	}
	else if(t==2)
	{	
		alert("Year must be 4 character num, ex 1980,pls input again. \n Năm phải là 4 kí tự, ví dụ 1980, vui lòng nhập lại.");
		return 0;
	}
	else if(t==3)
	{	
		alert("Incorrect type, ex dd/mm/yyyy, pls input again \n Nhập ngày tháng năm không hợp lệ.");
		txtBirthDT.GetControl().focus();
		return 0;
	}
	else if(t==4)
	{	
		alert("Incorrect month, month >=1 and month <= 12, pls input again \n Kiểu tháng không hợp lệ.");
		txtBirthDT.GetControl().focus();
		return 0;
	}
	else if(t==5)
	{	
		alert("Incorrect day, day <= the last day of the month, pls input again\nSố ngày tối đa trong tháng không đúng.");
		txtBirthDT.GetControl().focus();
		return 0;
	}
  return 1;
    
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
function OnDataError(obj)
{alert("Have error.Plase contact system admin.\n Hệ thống gặp lỗi vui lòng liên lạc admin");
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

function OnChangeDT(obj)
{ if(dtReceiveDT.value!='' && dtExpiryDT.value!='' && Number(dtReceiveDT.value)> Number(dtExpiryDT.value))
        {alert("Please input Expiry date greater than Receive Date ");
        obj.value='';
              return 0;
        }
  if(dtInterviewDT1.value!='' && dtExpiryDT.value!='' && Number(dtInterviewDT1.value)> Number(dtExpiryDT.value))
        {alert("Please input Expiry date greater than Interview Date ");
         obj.value='';
         return 0;
        }
  if(dtInterviewDT2.value!='' && dtExpiryDT.value!='' && Number(dtInterviewDT2.value)> Number(dtExpiryDT.value))
        {alert("Please input Expiry date greater than Interview Date ");
       obj.value='';
         return 0;
        }    
   if(dtInterviewDT3.value!='' && dtExpiryDT.value!='' && Number(dtInterviewDT3.value)> Number(dtExpiryDT.value))
        {alert("Please input Expiry date greater than Interview Date ");
       obj.value='';
         return 0;
        } 
    if(dtInterviewDT1.value!='' && dtReceiveDT.value!='' && Number(dtInterviewDT1.value)< Number(dtReceiveDT.value))
        {alert("Please input Interview date greater than Receive Date ");
       obj.value='';
         return 0;
        }
  if(dtInterviewDT2.value!='' && dtReceiveDT.value!='' && Number(dtInterviewDT2.value)< Number(dtReceiveDT.value))
        {alert("Please input Interview date greater than Receive Date ");
       obj.value='';
         return 0;
        }    
   if(dtInterviewDT3.value!='' && dtReceiveDT.value!='' && Number(dtInterviewDT3.value)< Number(dtReceiveDT.value))
        {alert("Please input Interview date greater than Receive Date ");
       obj.value='';
         return 0;
        }
   if(dtInterviewDT1.value!='' && dtInterviewDT2.value!='' && Number(dtInterviewDT2.value)< Number(dtInterviewDT1.value))
        {alert("Please input Interview date 2 greater than Interview 1 Date ");
       obj.value='';
         return 0;
        } 
  if(dtInterviewDT3.value!='' && dtInterviewDT2.value!='' && Number(dtInterviewDT3.value)< Number(dtInterviewDT2.value))
        {alert("Please input Interview date 3 greater than Interview 2 Date ");
       obj.value='';
         return 0;
        }    
  if((dtInterviewDT3.value!='' || dtInterviewDT2.value!='') && dtInterviewDT1.value=='')
        {alert("Please input Interview date 1 ");
        dtInterviewDT3.value='';
        dtInterviewDT2.value='';
        obj.value='';
         return 0;
        }                                                                       
   if(dtInterviewDT3.value!='' && dtInterviewDT2.value=='' )
        {alert("Please input Interview date 2  ");
        obj.value='';
        dtInterviewDT3.value='';
       
         return 0;
        }                                                                            
                                                                     
      
}
function CheckInput(obj,num)
{if(num=='1' && dtInterviewDT1.value==''&& obj.text!='')
    {obj.text='';
     alert("Please input Interview date 1 ");
    }
 if(num=='2' && dtInterviewDT2.value==''&& obj.text!='')
    {obj.text='';
     alert("Please input Interview date 2 ");
    }
 if(num=='3' && dtInterviewDT3.value==''&& obj.text!='')
    {obj.text='';
     alert("Please input Interview date 3 ");
    }   
}
//---------------------------
function OnCheck()
{
    check="Y";
    datCheck.Call();
}
//------------------------
function OnProfile()
{
  
    if(lstProfile.value =="N")
    {
        td1.style.display ="block" ;
        td2.style.display="block" ;
        txtProfile.SetReadOnly(1);
    }
    else 
    {
        td1.style.display = "none";
        td2.style.display = "none";
        txtProfile.SetReadOnly(1);
    }
}
function OnShowProfile()
{

        var fpath = System.RootURL + "/form/ch/pr/chpr00010_profile.aspx?code=HR0162&rec_pk="+ txtRec_PK.text ;
	    var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
        if (obj!=null)
	    {
                txtProfile.text = "";
                txtProfile_Code.text = "";
	            var arrTemp;
                for( var i=0; i < obj.length; i++)	  
                {	
                  
                  arrTemp = obj[i];
                  txtProfile_Code.text +=   arrTemp[3] + ","  ;
                  txtProfile.text += arrTemp[12] +"," ;
                }
               txtProfile.text = txtProfile.text.substr(0,txtProfile.text.length-1);
               txtProfile_Code.text = txtProfile_Code.text.substr(0,txtProfile_Code.text.length -1) ;
               
	    }
}
function OnResetIntro()
{
    txtIntroductionID.text ="";
    txtIntroductionName.text ="";
}
function OnClear(obj)
{
    obj.text="";
}
</script>

<body style=" margin-bottom:0; margin-top:0; margin-right:0; margin-left:0" >
<!------------------------------------->
<gw:data id="datCheck" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00100_0" > 
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
            <dso  type="process" procedure="ST_HR_PRO_HRRE00100_1" > 
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
            <dso  type="process" procedure="ST_HR_PRO_HRRE00100_3" > 
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
        <dso type="list" procedure="ST_HR_PRO_HRRE00100_2" > 
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


<!------------------------------------>
<!------------------------------------>
<gw:data id="datRec" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,52,53,54 ,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77" function="ST_HR_SEL_HRRE00100_0" procedure="ST_HR_UPD_HRRE00100_0"> 
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
                    <inout bind="txtOtherContact" /> 
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
                    
                    <inout bind="txtHeight" />
                    <inout bind="txtWeight" />
                    <inout bind="txtHealth" />
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
<table border=0 >
<tr style="height:0%; width:100%">
    <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
    <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
    <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
    <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
    <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
    
</tr>
<tr style="height:5%; width:100%">
  <td colspan=6 align=right>Recruitment ID</td>
  <td  colspan=8><gw:textbox id="txtID"  text="" 	maxlen = "10" styles='width:100%;' csstype="mandatory"  onenterkey="OnEnterRec()" /></td>   
  <td colspan=22 ></td>
  <td colspan=2  style="border:0">  <gw:button id="ibtnResetE" alt="Reset" img="Reset" text="Reset" onclick="OnReset()" /> </td>
  <td colspan=2  style="border:0"><gw:button id="ibtnUpdate" alt="Save" img="save" text="Save" onclick="OnUpdate()" /></td>
  <td colspan=2  style="border:0"><gw:button id="ibtnSearch"  alt="Popup"  img="popup" text="Search"  onclick="OnSearch()" /></td>
  <td colspan=2  style="border:0"><gw:button id="ibtnDelete"  alt="Delete"  img="delete"  text="Delete"  onclick="OnDelete()" /></td>
</tr>

<tr >
<td colspan=50 align=center>
<fieldset style="border-color:blue"><legend><font color="#e9361d" size="2" > Curriculum Vitae</font></legend>
    <table width='100%'>
        <tr ><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        </tr>
        <tr> 
        <td colspan=4 align=center>Full Name </td>
        <td colspan=6><gw:textbox id="txtFullName"  maxlen = "60" text="" styles='width:100%;' csstype="mandatory" onkeypress="checkKey()" /></td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show sex code" onclick="OnShowPopup('HR0007',lstSEX)" href="#tips" >
                            Sex</a> </td>
        <td colspan=6><gw:list  id="lstSEX" value=" " styles='width:100%'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show nation code" onclick="OnShowPopup('HR0009',lstNation)" href="#tips" >
                            Nation</a></td>
        <td colspan=6><gw:list  id="lstNation" value='01' styles='width:100%'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>||
                            </data>
                            </gw:list> 
        </td>
        <td colspan=10 rowspan=6 align=center>
        <gw:image id="imgFile"   view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:130;height:130"  />
        </td>
       
        </tr>
         <tr> 
        <td colspan=4 align=center>Birth date </td>
        <td colspan=6> <gw:textbox id="txtBirthDT"  text="" maxlen = "10" styles='width:100%' /> </td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show birth place" value='' onclick="OnShowPopup('HR0021',lstBirthPlace)" href="#tips" >
                            Birth Place</a> </td>
        <td colspan=6><gw:list  id="lstBirthPlace" value=" "  maxlen = "100" styles='width:100%'> 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>||
                            </data>
                            </gw:list> 
        </td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show ethnic"  onclick="OnShowPopup('HR0015',lstEthnic)" href="#tips" >
                            Ethnic</a></td>
        <td colspan=6> <gw:list  id="lstEthnic"  styles='width:100%' value='02'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0015' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        
       
        </tr>
       
        <tr> 
        <td colspan=4 align=center>Personal ID </td>
        <td colspan=4> <gw:textbox id="txtPersonalID"  maxlen = "10" text="" styles='width:100%;' onkeypress="return Numbers(event)"   onenterkey=""  /> </td>
        <td colspan=2> 
            <gw:icon id="idBtnCheck" img="2" text="Check" styles='width:100%' onclick="OnCheck()" />
         </td>
        <td colspan=4 align=center>Issue Date </td>
        <td colspan=6><gw:datebox id="dtIssueDT" text="" maxlen = "10" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept/>
        </td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show place id" onclick="OnShowPopup('HR0014',lstPlaceID)" href="#tips" >
                            Place ID</a></td>
        <td colspan=6><gw:list  id="lstPlaceID" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        
       
        </tr>
         <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Permanent Addr </td>
        <td colspan=16> <gw:textbox id="txtPerAdd"  text="" maxlen = "100" styles='width:100%'/> </td>
        <td colspan=4 align=center><a class="eco_link" title="Click here to show province id" onclick="OnShowPopup('HR0021',lstProvinceID)" href="#tips" >Province</td>
        <td colspan=6>  
            <gw:list  id="lstProvinceID" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        
       
        </tr>
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Current Addr </td>
        <td colspan=16> <gw:textbox id="txtLivingAdd"  text="" maxlen = "100" styles='width:100%' /> </td>
        <td colspan=4 align=center>Hand Phone</td>
        <td colspan=6><gw:textbox id="txtTel"  text="" maxlen = "15" styles='width:100%'   />  </td>
        </tr>
         <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Email</td>
        <td colspan=6> <gw:textbox id="txtEmail"  text="" maxlen = "100" styles='width:100%' /> </td>
        <td colspan=4 align="center" style="white-space:nowrap"> <a class="eco_link" title="Click here to show NCountry id" onclick="OnShowPopup('HR0021',lstNCountryID)" href="#tips" >N Country </td>
        <td colspan=6>  
            <gw:list  id="lstNCountryID" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        <td colspan=4 align=center style="white-space:nowrap">Home Phone</td>
        <td colspan=6>  
                        <gw:textbox id="txtHomePhone"  text="" maxlen = "100" styles='width:100%' />
        </td>
        
        </tr>
        
         <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Height(m)</td>
        <td colspan=6> <gw:textbox id="txtHeight"  type="number" format="#,###,###,###.##" text="" maxlen = "100" styles='width:100%' /></td>
        
        <td colspan=4 align=center style="white-space:nowrap">Weight(Kg)</td>
        <td colspan=6><gw:textbox id="txtWeight"  type="number" format="#,###,###,###.##" text="" maxlen = "100" styles='width:100%' />
        </td>
        <td colspan=4 align=center style="white-space:nowrap">State of Health</td>
        <td colspan=6><gw:textbox id="txtHealth"  text="" maxlen = "100" styles='width:100%' />
        </td>
        <td colspan=4 align=center style="white-space:nowrap">Marital Status</td>
        <td colspan=6>  <gw:list  id="lstMarital" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                LIST|N|Single|Y|Married
                            </data>
                            </gw:list> </td>
       
        
        </tr>
        
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show education" onclick="OnShowPopup('HR0011',lstEducation)" href="#tips" >Education</a></td>
        <td colspan=6><gw:list  id="lstEducation" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        <td colspan=4 align=center style="white-space:nowrap">Graduation School</a></td>
        <td colspan=6>  <gw:textbox id="txtSchool"  text="" maxlen = "100" styles='width:100%' /> </td>
        <td colspan=4 align=center style="white-space:nowrap">Major</td>
        <td colspan=6>  <gw:textbox id="txtMajor"  text="" maxlen = "100" styles='width:100%' /> </td>
        
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show result of education " onclick="OnShowPopup('HR0147',lstGraKind)" href="#tips" >Result</a></td>
        <td colspan=6>  <gw:list  id="lstGraKind" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0147' order by code_nm")%>||
                            </data>
                            </gw:list> </td>
        
        
       
        </tr>
       
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Other Certificate</td>
        <td colspan=6> <gw:textbox id="txtDegree"  text="" maxlen = "100" styles='width:100%' /></td>
        
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show foreign language " onclick="OnShowPopup('HR0143',lstLanguage)" href="#tips" >Foreign Language</a></td>
        <td colspan=6><gw:list  id="lstLanguage" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0143' order by code_nm")%>||
                            </data>
                            </gw:list>
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show language skill" onclick="OnShowPopup('HR0144',lstLanguageSkill)" href="#tips" >Language Certificate</a></td>
        <td colspan=6>  <gw:list  id="lstLanguageSkill" value=" " maxlen = "10" styles='width:100%' > 
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0144' order by code_nm")%>||
                            </data>
                            </gw:list> </td>
       <td colspan=4 align=center style="white-space:nowrap">Other Language</td>
        <td colspan=6><gw:textbox id="txtOtherLanguage"  text="" maxlen = "100" styles='width:100%' />
               </td>
        
        
        </tr>
    
    <td colspan=30 >
        <fieldset> <legend><font color="#e9361d" size="1" >Experiences</font></legend>
            <table width='100%'>
                <tr ><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
                
                </tr>
               <tr>
                    <td colspan=4  align="center" style="white-space:nowrap">Old Company</td>
                    <td colspan=6 > <gw:textbox id="txtCompany"  text="" maxlen="100" styles='width:100%' /></td>
        
                    <td colspan=4  align="center" style="white-space:nowrap">Old Position</td>
                    <td colspan=6  align="left"> 
                        
                            <gw:textbox id="txtPosition_Old"  text="" maxlen="100" styles='width:100%' />
                    </td>
        
                    <td  colspan=4 rowspan=2 align=center>Reason left</td> 
                    <td colspan=6 rowspan=2  ><gw:textarea id="txtareaReason" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea></td>
                </tr>
                <tr>
                    <td colspan=4  align="center" style="white-space:nowrap">Old Salary</td>
                    <td colspan=6 > <gw:textbox id="txtSalary_Old" onkeypress="return Numbers(event)" type="number" format="#,###,###,###.##"  text=" " styles='width:100%' /></td>
        
                    <td colspan=4  align="center" style="white-space:nowrap">Seniority</td>
                    <td colspan=6 > <gw:textbox id="txtSenior" maxlen=100  text="" styles='width:100%' /> </td>

                </tr>
            </table>    
        </fieldset>
    </td>
    <td colspan=4 align=center style="white-space:nowrap">Computer Skill</td>
    <td colspan=6> <gw:textbox id="txtComputerSkill"  text="" maxlen = "100" styles='width:100%' /></td>
   <tr >
<td colspan=40 align=center>
<fieldset> <legend><font color="#e9361d" size="1" >Apply</font></legend>
    <table width='100%'>
        <tr ><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        </tr>
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show request" onclick="OnShowPopup(4,'')" href="#tips" >Recruitment Request</a></td>
        <td colspan=6>
        <gw:textbox  id="txtRequest"  text="" styles='width:100%'csstype="mandatory"  />
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(3,'')" href="#tips" >
                            Organization</a></td>
        <td colspan=6><gw:list  id="lstOrg_Code" value=" " maxlen = "100" styles='width:100%' >
                            <data>
                                <%=CtlLib.SetListDataSQL("SELECT PK, ORG_NM FROM TCO_ORG A WHERE a.DEL_IF=0 and nvl(a.end_date,to_char(sysdate+1,'yyyymmdd'))>to_char(sysdate,'yyyymmdd') ORDER BY NVL(SEQ,99999)")%>||
                            </data>
                        </gw:list>
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show position code" onclick="OnShowPopup('HR0008',lstPosition)" href="#tips" >
                            Position</a></td>
        <td colspan=6>  <gw:list  id="lstPosition" value=" " maxlen = "100" styles='width:100%'>
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>||
                            </data>
                            </gw:list> </td>
       <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show job code" onclick="OnShowPopup('HR0010',lstJob)" href="#tips" >
                            Job</a></td>
        <td colspan=6><gw:list  id="lstJob" value=" " styles='width:100%' >
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>||
                            </data>
                            </gw:list> 
        </td>
        
        
        </tr>
        <tr>
         <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show empployee type" onclick="OnShowPopup('HR0017',lstJob)" href="#tips" >
                            Employee Type</a></td>
        <td colspan=6><gw:list  id="lstEmpType" styles='width:100%' >
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm")%>
                            </data>
                            </gw:list> 
        </td>
       
        <td colspan=4 align=center style="white-space:nowrap">Salary</td>
        <td colspan=6><gw:textbox  id="txtBasicSal" type="number" format="#,###,###,###.##R" text="" styles='width:100%' /> </td>
          <td colspan=4 align=center style="white-space:nowrap">Other Request</td>
        <td colspan=16><gw:textarea id="txtareaRequest" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea> </td>
        </tr>

    </table>
</fieldset>
</td>  
</tr>

<td colspan=50 align=center>
<fieldset style="border-color:Blue"> 
    <table width='100%'>
        <tr ><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        </tr>
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Receive Date</td>
        <td colspan=6><gw:datebox id="dtReceiveDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>"  onchange="OnChangeDT(this)" />
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'0')" href="#tips" >
                            Introduction ID</a></td>
        <td colspan=6>  <gw:textbox  id="txtIntroductionID" text="" styles='width:100%' csstype="mandatory"  /> </td>
       <td colspan=4 align=center style="white-space:nowrap">
                            Introduction Name</td>
        <td colspan=5>  <gw:textbox  id="txtIntroductionName"  text="" styles='width:100%' csstype="mandatory"  /> </td>
        <td colspan=1><gw:imgBtn id="ibtnResetIntro" alt="Reset Introduction" img="Reset" text="Reset" onclick="OnResetIntro()" /> </td>
        <td colspan=4 align=center style="white-space:nowrap">Expiry Date</td>
        <td colspan=6><gw:datebox id="dtExpiryDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" /> </td>
        
        
        </tr>
        <tr>
        
        <td colspan=4 align=center style="white-space:nowrap">Full Profile</td>
        <td colspan=3><gw:list  id="lstProfile" styles='width:100%' onchange="OnProfile()" >
                            <data>
                                |||Y|YES|N|NO
                            </data>
                            </gw:list> 
                             </td>
        <td colspan=3></td>
       <td id="td1" colspan=4 align=center style="white-space:nowrap;display:none"><a class="eco_link" title="Click here to show minus profiles" onclick="OnShowProfile()" href="#tips" >Minus Profiles</a></td>
       <td id="td2" colspan=6 align=center style="white-space:nowrap;display:none"><gw:textbox id="txtProfile" maxlen=100 styles='width:100%'    /></td>
       <td colspan=4 align=center style="white-space:nowrap">Note</td>
        <td colspan=16><gw:textarea id="txtareaNote" maxlen=100 styles='width:100%'  onkeypress="" csstype=""/></gw:textarea> </td>                      
        </tr>
        <tr>
        <td colspan=40>
        <fieldset><legend><font color="#e9361d" size="1" >Interview</font></legend>
    <table width='100%'>
        <tr ><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        <td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td><td style="width:2.5%" ></td>
        </tr>
        <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Interview DT1 </td>
        <td colspan=3><gw:datebox id="dtInterviewDT1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
        </td>
        <td colspan=3>
            <gw:textbox  id="txtITV1_Hours" text="--Hours--" styles='width:100%' onFocus="OnClear(txtITV1_Hours)"  />
        </td>
         <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'1')" href="#tips" >
                            Interviewer 1</a></td>
        <td colspan=6>  <gw:textbox  id="Interviewer1" text="" styles='width:100%' csstype="mandatory"  /> </td>
        
        <td colspan=4 align=center style="white-space:nowrap">Result 1</td>
        <td colspan=6>  
            <gw:list  id="lstResult1" styles='width:100%' value="03" >
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
                            </data>
            </gw:list> 
        </td>
       <td colspan=4 align=center style="white-space:nowrap">Remark 1</td>
        <td colspan=6>  <gw:textbox  id="txtRemark1"  text="" styles='width:100%' onchange="CheckInput(this,1)"  /> </td>
             
        </tr>
         <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Interview DT2 </td>
        <td colspan=3><gw:datebox id="dtInterviewDT2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
        </td>
        <td colspan=3>
            <gw:textbox  id="txtITV2_Hours" text="--Hours--" styles='width:100%' onFocus="OnClear(txtITV2_Hours)"  />
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'2')" href="#tips" >
                            Interviewer 2</a></td>
        <td colspan=6>  <gw:textbox  id="Interviewer2" text="" styles='width:100%' csstype="mandatory"  /> </td>
      
        <td colspan=4 align=center style="white-space:nowrap">Result 2</td>
        <td colspan=6>  
            <gw:list  id="lstResult2" styles='width:100%' value="03" >
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
                            </data>
            </gw:list> 
        </td>
       <td colspan=4 align=center style="white-space:nowrap">Remark 2</td>
        <td colspan=6>  <gw:textbox  id="txtRemark2"  text="" styles='width:100%' onchange="CheckInput(this,2)" /> </td>
             
        </tr>
         <tr> 
        <td colspan=4 align=center style="white-space:nowrap">Interview DT3 </td>
        <td colspan=3><gw:datebox id="dtInterviewDT3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="OnChangeDT(this)" />
        </td>
        <td colspan=3>
            <gw:textbox  id="txtITV3_Hours" text="--Hours--" styles='width:100%' onFocus="OnClear(txtITV3_Hours)"  />
        </td>
        <td colspan=4 align=center style="white-space:nowrap"><a class="eco_link" title="Click here to show employee id code" onclick="OnShowPopup(2,'3')" href="#tips" >
                            Interviewer 3</a></td>
        <td colspan=6>  <gw:textbox  id="Interviewer3" text="" styles='width:100%' csstype="mandatory"  /> </td>
      
        <td colspan=4 align=center style="white-space:nowrap">Result 3</td>
        <td colspan=6>
            <gw:list  id="lstResult3" styles='width:100%' value="03">
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
                            </data>
            </gw:list> 
        </td>
       <td colspan=4 align=center style="white-space:nowrap">Remark 3</td>
        <td colspan=6>  <gw:textbox  id="txtRemark3"  text="" styles='width:100%' onchange="CheckInput(this,3)" /> </td>
             
        </tr>
        <tr>
        <td colspan=4 align=center>Pass </td>
        <td colspan=6>
        <gw:list  id="lstPass" value='03' styles='width:100%' >
                            <data>
                                <%= CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code")%>
                            </data>
                            </gw:list> 
        </td>
        <td colspan=4 align=center>Start Working </td>
        <td colspan=6>
        <gw:datebox id="dtJoinDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
        </td>
        <td colspan=4 align="center">Return Profile DT</td>
        
        <td colspan=6>
        <gw:datebox id="dtReturnProfile"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
        </td>
        
        <td colspan=4 align="center">Reason Return</td>
        
        <td colspan=6> <gw:textbox  id="txtReasonReturn"  text="" styles='width:100%'  /></td>
        </tr>
    </table>
</fieldset>
        </td>
        </tr>
        
    </table>
</fieldset>
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


