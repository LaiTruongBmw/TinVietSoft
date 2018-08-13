<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var b_status="";
var b_search=false;
var binit=true;
var value_before;
var dt_tmp;
//"Employee(s)|Emp Male|Emp Female|Position|Education|Experience (Years)|Height|Weight|Major|Area|Shift Working|Language|Language Certificate|Computer Skill|Other|Remark|_Master_PK|_pk|Approver Remark|_Status"   
var c_emp=0;
    c_male = 1;
    c_female = 2;
var c_pos=3;
var c_edu=4;
var c_exp=5;
    c_height =6;
    c_weight =7;
    c_major =8;
    c_area =9;
    c_shift =10
var c_lang=11;
var c_lang_c=12;
var c_com=13;
var c_oth=14;
var c_remark=15;
var c_master_pk=16;
var c_detail_pk=17;
var c_approver_remark=18;
var c_status=19;

var t1;
function BodyInit()
{        
  
   SetDisableInit();
   grdRec_detail.GetGridControl().ColFormat(0) = "(###,###,###)";   
   grdRec_detail.GetGridControl().Cell( 7, 0, c_approver_remark,     0, c_approver_remark     ) = 0x3300cc;  

   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_pos,t1);
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0160' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_edu,t1);
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0143' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_lang,t1);    
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0144' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_lang_c,t1);  
   
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_area,t1);
   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0161' order by code_nm")%>";
       grdRec_detail.SetComboFormat(c_shift,t1);

   OnReset();
  txtApproverNote.SetEnable(false);
  
  
   txtEmp_PK.text="<%=session("EMPLOYEE_PK")%>";
   txtMaker.text="<%=session("EMPLOYEE_PK")%>";
   txtApplicant_PK.text="<%=Request.querystring("p_rec_request_pk")%>";
   if (txtApplicant_PK.text!="")
       datApplicant.Call("SELECT");       
   else
      datRec_Emp_Infor.Call();
      
}
//------------------------
function SetDisableInit()
{
   txtEmp_ID.SetEnable(false);
   txtFull_Name.SetEnable(false);
   txtOrg_nm.SetEnable(false);
   txtApprover_ID.SetEnable(false);
   txtApprover_Name.SetEnable(false);
 
   SetEnableButton(false);
   ibtnApprove.SetEnable(false);
   ibtnCancel.SetEnable(false);
   txtTotal_person.SetEnable(false);
   ibtnDelete.SetEnable(false);
   txtApp_Status.SetEnable(false);
}

//-------------------------------------------------
function SetEnableButton(b)
{
    
    ibtnExcel.SetEnable(b);
    ibtnApprove.SetEnable(b);
    //ibtnCancel.SetEnable(b);
    ibtnDelete.SetEnable(b);
    
    ibtnAdd_C.SetEnable(b);
   
    ibtnSave_C.SetEnable(b);
   
    ibtnDelete_C.SetEnable(b);
   
}
//-------------------------------------------------
function OnNew()
{
    OnReset();
}
//--------------------------------------------------
function OnReset()
{
    datApplicant.StatusInsert();
    
    txtEmp_PK.text="<%=session("EMPLOYEE_PK")%>";
    txtMaker.text="<%=session("EMPLOYEE_PK")%>";
    txtTotal_person.text="";
    txtApplicant_PK.text="";
    SetEnableButton(false);
    ibtnAdd.SetEnable(false);
    ibtnSave.SetEnable(true);

    grdRec_detail.ClearData();
      datRec_Emp_Infor.Call();
      
    
    
    
   
   
    
   
}
//-------------------------------------------------
function OnSave()
{
        if (txtApplicant_PK.text=="")
        {
            if (CheckSave())
            {
                if (confirm("Do you want to insert new data? \n Bạn có muốn tạo mới thông tin?"))
                {
                    b_status="Insert";
                    datApplicant.Call();
                }
            }
        }
        else
        {
            if (confirm("Do you want to save data? \n Bạn có muốn cập nhật thông tin?"))
            {
                b_status="Update";
                datApplicant.StatusUpdate();
                datApplicant.Call();
            }
        }
}
//------------------------------------------
function OnDelete()
{
    datApplicant.StatusDelete();
    datApplicant.Call();
}
//------------------------------------------
function OnPopup()
{
    var fpath = System.RootURL + "/standard/forms/hr/re/hrre00201.aspx?emp_id=" + txtEmp_ID.text;
    var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	if (obj!=null)
	{
	    txtApplicant_PK.text=obj[0];
	    b_status="";
	    SetEnableButton(true);
	    datApplicant.Call("SELECT");
	}
}
//------------------------------------------
function OnShowPopup(objid)
{
    switch (objid)
    {
        case 1:
        {
            var fpath = System.RootURL + "/standard/forms/hr/re/hrre00202.aspx" ;
            var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	        if (obj!=null)
	        {
                txtEmp_PK.text=obj[0];
                txtEmp_ID.text=obj[1];
                txtFull_Name.text=obj[2];
                txtorg_pk.text=obj[3];
                txtOrg_nm.text=obj[4];
                txtApprover_PK.text=obj[5];
                txtApprover_ID.text=obj[6];
                txtApprover_Name.text=obj[7];
                
	        }
	        break;
	    }
	    case 2:
	    {
	        var strcom
            var fpath = System.RootURL + "/standard/forms/hr/re/hrre00203.aspx";
            var obj  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes');
            if (obj!=null)
	        {
                txtApprover_PK.text=obj[0];
                txtApprover_ID.text=obj[1];
                txtApprover_Name.text=obj[2];
	        }
            break;
        }
        case 3:
	    {
	        var strcom
            var fpath = System.RootURL + "/standard/forms/hr/re/hrre00204.aspx?idcode=REC";
            var obj  = System.OpenModal(  fpath , 900 , 450 , 'resizable:yes;status:yes');
            break;
        }
		case 4:
		{
			var strcom;
			var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
			var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
			if (obj!=null)
			{  
				
			}
			break;
		}
        
    }    
}
//--------------------------------------------------
function OnDelete()
{
    if (confirm("Do you want to delete this infor? \n Bạn muốn xóa thông tin này?"))
    {
        b_status="Delete";
        b_delete="true";
        datApplicant.StatusDelete();
        datApplicant.Call();
    }
}

//--------------------------------------------------
function OnDataReceive(obj)
{   
    switch(obj.id)
    {
        case "datApplicant":
        {
            ibtnAdd.SetEnable(true);
            if (b_status=="Insert")
            {
                SetEnableButton(true);
                ibtnApprove.SetEnable(true);
                if (txtApplicant_PK.text!="")
                    alert("Insert Successful! \n Tạo mới thành công");
                else
                    alert("Insert fail! \n Tạo mới thất bại");
                b_status="";
            }
            else if (b_status=="Update")
            {    
                b_status="";
                if (txtApplicant_PK.text!="")
                {
                    alert("Update Successful! \n Cập nhật thành công");
                    b_search=true;//search cac tab detail
                    //datTrans_Exp.Call("SELECT");
                }
                else
                    alert("Update fail! \n Cập nhật thất bại");
            }
            else if (b_status=="Delete")//delete
            {
                b_status="";
                if (txtApplicant_PK.text!="-1")
                {
                    alert("Delete Successful! \n Xóa thành công");
                    
                }
                else
                    alert("Delete fail! \n Xóa thất bại");
            }
            else // if (b_status=="")
            {
                if (txt_Status_code.text=="01") // dang o muc save
                {
                    SetEnableButton(true);
                    ibtnSave.SetEnable(true);
                    
                }
                else
                {
                    SetEnableButton(false);
                    ibtnSave.SetEnable(false);
                }
                    
                datRecDetail.Call("SELECT");
                b_search=true;//search cac tab detail
            }
            
            break;
        }   
        case "datFind_Applicant":
            if (txtApplicant_PK.text=='-1')
                alert("Do not have this applicant! \n Không có đơn này!");
            else
                datApplicant.Call("SELECT");
            break;
        case "datRecDetail":
            var t=0;
            auto_resize_column(grdRec_detail,0,grdRec_detail.cols-1,0);
            var test=0;
            for(var i=1;i<grdRec_detail.rows;i++)
                {   t+=Number(grdRec_detail.GetGridData(i,c_emp));
                 
                 if(grdRec_detail.GetGridData(i,c_status)=='03')
                    {grdRec_detail.SetCellBgColor(i,0,i ,c_approver_remark,0x99FFcc); //duoc approv
                    grdRec_detail.SetRowEditable(i,'');
                    }
                 if(grdRec_detail.GetGridData(i,c_status)=='04')
                    {grdRec_detail.SetCellBgColor(i,0,i ,c_approver_remark,0x6633FF);//bi reject
                    grdRec_detail.SetRowEditable(i,'');
                    }
                 if(grdRec_detail.GetGridData(i,c_status)=='05')     
                    {grdRec_detail.SetCellBgColor(i,0,i ,c_approver_remark,0x99FFFF); //duoc request 
                    grdRec_detail.SetRowEditable(i,1);
                    }
                 if(grdRec_detail.GetGridData(i,c_status)=='02')    
                    grdRec_detail.SetRowEditable(i,'');
                 if(grdRec_detail.GetGridData(i,c_status)!='02' && txt_Status_code.text=='02')
                 test=1;
                        
                }
                if(test==0 && txt_Status_code.text=='02')
                {ibtnCancel.SetEnable(true);
                }
                else
                ibtnCancel.SetEnable(false);
                if(txt_Status_code.text=='02')
                ibtnSave_C.SetEnable(false);
            txtTotal_person.text=t;    
            
            
            break;
        case "datGetApprove":
        {
            if (txt_Status_code.text!="-1")
            {
                alert("Approving successful! \n Đề nghị thành công!");
                ibtnApprove.SetEnable(false);
                ibtnCancel.SetEnable(true);
                SetEnableButton(false);
                ibtnSave.SetEnable(false);
                datRecDetail.Call();
            }
            else
                alert("Approving failed! \n Đề nghị thất bại!");
            break;
        }
         case "datGetCancel":
        {
            if (txt_Status_code.text!="-1")
            {
                alert("Cancel successful! \n Hủy thành công!");
                ibtnApprove.SetEnable(true);
                ibtnCancel.SetEnable(false);
                SetEnableButton(true);
                ibtnSave.SetEnable(true);
            }
            else
                alert("Cancel failed! \n Huỷ thất bại!");
            break;
        }
        
    }
}
//----------------------------------------------
function OnNewDetail(objgrd,app_pk,currency)
{
    objgrd.AddRow();
    objgrd.GetGridControl().TopRow=objgrd.rows-1;
    objgrd.SetGridText(objgrd.rows-1,c_master_pk,txtApplicant_PK.text);
    
    
   

  
}
var old_value;
//-----------------------------------
function OnChange(obj)
{ 
   {if(grdRec_detail.GetGridData(grdRec_detail.row,c_status)!='02'&&grdRec_detail.GetGridData(grdRec_detail.row,c_status)!='03' && grdRec_detail.GetGridData(grdRec_detail.row,c_status)!='04' )
    { //ibtnDelete_C.SetEnable(true);
      ibtnSave_C.SetEnable(true);
     // ibtnAdd_C.SetEnable(true);
    }
   /* else
    {ibtnDelete_C.SetEnable(false);
      ibtnSave_C.SetEnable(false);
      ibtnAdd_C.SetEnable(false);
      
    }*/
 }
}
//----------------------------------------
function OnSaveDetail(objdat)
{
    if(OnCheckData())
    {
        var bsave=false;
        if (confirm("Do you want to save? \n Bạn có muốn lưu không?"))
        {
            bsave=true;
            objdat.Call();
        }
    }
    else return;
}
//----------------------------------------
function OnDeleteDetail(objgrd)
{

    if (confirm("Do you want to delete? \n Bạn có muốn xóa không?"))
        objgrd.DeleteRow();
}
//----------------------------------------
function CheckSave()
{
    

    if (txtEmp_PK.text=="") 
    {
        alert("Please select employee! Vui lòng chọn người nhân viên!");
        return false;
    }
    if (txtApprover_PK.text=="")
    {
        alert("Please select approver! Vui lòng chọn người duyệt!");
        return false;
    }
    if(dtFrom.value=="" ||dtTo.value=="" )
    {
        alert("Please input Biz period!\nBạn phải nhập thời hạn từ ngày đến ngày");
        return false;
    }    
    if(Number(dtFrom.value)>=Number(dtTo.value))
    {
        alert("From date must be smaller than to date!\nTừ ngày phải nhỏ hơn đến ngày");
        return false;
    }    
    if(txtPeriod.text=="")
    {
        alert("Please input Biz period!\nBạn phải nhập lần tuyển dụng");
        return false;
    } 
    
    return true;
}

//-----------------------------
function on_edit_before(objgrd)
{
    value_before=objgrd.GetGridData(event.row,event.col);
    //alert(value_before);
}
//-------------------------------
function OnApprove()
{  if(grdRec_detail.rows >1)
    {if (confirm("Do you want to approve this? \n Bạn có muốn đề nghị đơn này không?"))
        datGetApprove.Call();
    }
    else
    alert("Please input detail infomation!\n Bạn phải nhập thông tin chi tiết.")   ; 
}
//-------------------------------
function OnCancel()
{  
    if (confirm("Do you want to Cancel this? \n Bạn có muốn huỷ đơn này không?"))
        datGetCancel.Call();
    
    
}
//-------------------------------
function OnReplicate()
{
    if (confirm("Do you want to replicate this applicant? \n Bạn có muốn tạo bảng copy của đơn này không?"))
    {
        datBizReplicate.Call();
    }
}
//--------------------------------
function OnEnterApp()
{
    datFind_Applicant.Call();
}

function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function show_popup()
{
    var col=grdRec_detail.col;
    var row=grdRec_detail.row;
    if((col==c_pos || col==c_edu || col==c_lang || col==c_lang_c) && (grdRec_detail.GetGridData(grdRec_detail.row,c_status)=='05'||grdRec_detail.GetGridData(grdRec_detail.row,c_status)=='01'||grdRec_detail.GetGridData(grdRec_detail.row,c_status)=='05'))
    {
        var strtemp;
        if(col==c_pos)
            strtemp="HR0008";
        if(col==c_edu)
            strtemp="HR0011";
        if(col==c_lang)
            strtemp="HR0143"; 
        if(col==c_lang_c)
            strtemp="HR0144"; 
                  
        var fpath = System.RootURL + "/form/ch/ae/chae00010_com_code.aspx?code=" +  strtemp ;
        var strid = strtemp;
        
	    var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
	    
	    if (obj!=null)
	    {
	        var strcodereturn=obj[1];
	       
	        if (obj[0]==1 )  //modify common code
	        {
	            alert(obj[0]);
	            if(col==c_pos)
	            {
	                t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
                    grdRec_detail.SetComboFormat(c_pos,t1);
                }   
                if(col==c_edu)
                {
                    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>";
                    grdRec_detail.SetComboFormat(c_edu,t1);
                }  
                if(col==c_lang)
                {  
                    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0143' order by code_nm")%>";
                    grdRec_detail.SetComboFormat(c_lang,t1);   
                }
                if(col==c_lang_c)
                {     
                    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0144' order by code_nm")%>";
                    grdRec_detail.SetComboFormat(c_lang_c,t1);  
                }    
                
	        }
	        if (strcodereturn!=0)
                grdRec_detail.SetGridText(row,col,strcodereturn);
	        
	    }
    }
}
//-----------------------------
function On_Click()
{ 
	dt_tmp=grdRec_detail.GetGridData(event.row,event.col)//luu tru gia tri vua click  
}
function OnCheckData()
{
   var ctrl = grdRec_detail.GetGridControl();
   var rows = ctrl.rows;
   for(i=1; i<rows; i++)
   { 
        if(grdRec_detail.GetGridData(i, c_emp)=="")
        {
            alert("You have to input Employee(s) colunm\nBạn phải nhập tổng số nhân viên cần tuyển!");
            return 0;
        }
        else
        {
            if((parseInt(grdRec_detail.GetGridData(i, c_male)) + parseInt(grdRec_detail.GetGridData(i, c_female))) != parseInt(grdRec_detail.GetGridData(i, c_emp)) && (grdRec_detail.GetGridData(i, c_male)!="" || grdRec_detail.GetGridData(i, c_female)!="") )
            {
                alert("Total employee male and female not match\nTổng số nhân viên nam và nữ chưa đúng!");
                return 0;
            }
        }
    }
    return 1;
}

</script>
<body bgcolor='#F5F8FF'>
<!---------------------main employee tab data control------------------>
<!----------------------------------->
<gw:data id="datGetApprove" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00200_0" > 
                <input>                    
                   <input bind="txtApplicant_PK" />
                </input> 
                <output>
                    <output bind="txt_Status_code" />
                    <output bind="txtApp_Status" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:data id="datGetCancel" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00200_1" > 
                <input>                    
                   <input bind="txtApplicant_PK" />
                </input> 
                <output>
                    <output bind="txt_Status_code" />
                    <output bind="txtApp_Status" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!----------------------------------->

<gw:data id="datFind_Applicant" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00200_2" > 
                <input>                    
                   <input bind="txtApplication_No" />
                </input> 
                <output>
                    <input bind="txtApplicant_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!----------------------------------->
<gw:data id="datRec_Emp_Infor" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRRE00200_3" > 
                <input>
                    <input bind="txtEmp_PK" />
                </input> 
                <output>
                    <output bind="txtEmp_ID" />
                    <output bind="txtFull_Name" />
                    <output bind="txtApprover_ID" />
                    <output bind="txtApprover_Name" />
                    <output bind="txtOrg_nm" />
                    <output bind="txtApprover_PK" />
                    <inout bind="txtorg_pk"/>
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------>
<gw:data id="datApplicant" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="control" parameter="0,1,4,5,6,9,10,11,12,14,15,16,17" function="ST_HR_SEL_HRRE00200_0" procedure="ST_HR_UPD_HRRE00200_0"> 
                <inout>
                    <inout bind="txtApplicant_PK" /> 
                    <inout bind="txtEmp_PK"/>
                    <inout bind="txtEmp_ID"/>
                    <inout bind="txtFull_Name"/>
                    <inout bind="txtOrg_nm"/>
                    <inout bind="txtorg_pk"/>
                    <inout bind="txtApprover_PK"/>
                    <inout bind="txtApprover_ID"/>
                    <inout bind="txtApprover_Name"/>
                    <inout bind="txtDescription"/>
                     <inout bind="txtperiod"/>
                    <inout bind="dtFrom"/>
                    <inout bind="dtTo"/>
                    <inout bind="txtApp_Status"/>
                    <inout bind="txtApplication_No"/>
                    <inout bind="txtMaker"/>
                    <inout bind="txt_Status_code"/>
                    <inout bind="txtApproverNote"/>
                </inout> 
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:data id="datRecDetail" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRRE00200_1" procedure="ST_HR_UPD_HRRE00200_1" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"> 
                <input>
                    <input bind="txtApplicant_PK" />
                </input>
                <output  bind="grdRec_detail" />
            </dso> 
        </xml> 
</gw:data>


<!---------------------expand employee tab data control------------------>
 
 <table id="main" width="100%" cellpadding="0" cellspacing="0" border=0 style="width:100%;height:100%;">
    <tr style="height:25%;" >
        <td>
            <fieldset style="height:100%;" > 
            <legend><font color="#e9361d" size="2" >Master Recruitment</font></legend>
                <table width="100%" id="tbloth" style="height:90%" border=0 cellpadding="1" cellspacing="0">
                    <tr>
                    	<td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td>
                    	<td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td>
                    	<td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td>
                    	<td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td>
                    	<td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td><td width="2%">&nbsp;</td>
                    </tr>
                	<tr>
                	     <td colspan=5 align="right"><a title="Click here to show applicant" onClick="OnShowPopup(3)" href="#tips" >Application No &nbsp;</a></td>
                        <td colspan=5><gw:textbox id="txtApplication_No"  text="" 	styles='width:100%;' csstype="mandatory"  onenterkey="OnEnterApp()" /></td>
                        <td colspan=10><gw:textbox id="txtApp_Status"  text="" 	styles='width:100%;'  onenterkey="" /></td>
                    	
                        <td colspan="2"><gw:button text="popup" img="popup" id="ibtnSearch"    alt="Find application"  onclick="OnPopup()"/></td>
                        <td  colspan="2"><gw:button text="new" img="new" id="ibtnAdd"    alt="Add"  onclick="OnNew()"/></td>
                        <td  colspan=2><gw:button text="save" img="save" id="ibtnSave"    alt="Save"  onclick="OnSave()"/></td>
                        <td  colspan=2><gw:button text="delete" img="delete" id="ibtnDelete"    alt="Delete"  onclick="OnDelete()"/></td>
                        <td  colspan=2><gw:button text="excel" img="excel" id="ibtnExcel"    alt="Excel"  onclick="OnExcel()"/></td>
                        <td align="center" colspan=5><gw:icon id="ibtnApprove" img="in" text="Approval Request" onclick="OnApprove()" /></td>
                        <td align="center" colspan=5><gw:icon id="ibtnCancel" img="in" text="Cancel Request" onclick="OnCancel()" /></td>
                        
                    </tr>
                   
                    <tr>
                        <td colspan=5 align="right"><a title="Click here to show applicant" onClick="OnShowPopup(1)" href="#tips" >Applicant &nbsp;</a></td>
                        <td colspan=5><gw:textbox id="txtEmp_ID"  text="" 	styles='width:100%;' csstype="mandatory"  onenterkey="" /></td>
                        <td colspan=10><gw:textbox id="txtFull_Name"  text="" 	styles='width:100%;' csstype="mandatory"  onenterkey="" /></td>
                        <td colspan=5 align="right"><a title="Click here to show organization" onClick="OnShowPopup(4)" href="#tips" >Organzation &nbsp;</a></td>
                        <td colspan=25><gw:textbox id="txtOrg_nm" text="" styles='width:100%;' csstype="mandatory" /></td>
                        
                        
                    </tr>
                    <tr>
                    	<td colspan=5 align="right"><a title="Click here to show approver" onClick="OnShowPopup(2)" href="#tips" >Approver &nbsp;</a></td>
                        <td colspan=5><gw:textbox id="txtApprover_ID"  text=""  styles='width:100%;' csstype="mandatory" /></td>
                        <td colspan=10><gw:textbox id="txtApprover_Name"  text="" 	styles='width:100%;' csstype="mandatory"   /></td>  
                        <td colspan=5 align="right"><b style="color:Red">Approver Note &nbsp;</b></td>  
                        <td colspan=25><gw:textbox id="txtApproverNote" text="" styles='width:100%;'  csstype="mandatory" /></td> 
                         
                    </tr>
                    <tr>
                    	<td colspan=5 align="right">Period(times) &nbsp;</td>
                        <td colspan=5 align="right"><gw:textbox id="txtPeriod"  text="" 	styles='width:100%;'  /></td>
                        <td colspan=5 align="right"><gw:datebox id="dtFrom"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept  /></td>
                        <td colspan=1 align="center"><b>-</b></td>
                        <td colspan=5 align="left"><gw:datebox id="dtTo"  text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept /></td>
                        <td colspan=2 align="right">&nbsp;</td>
                        <td colspan=5 align="right">Total Employee(s) &nbsp;</td>
                        <td colspan=5><gw:textbox id="txtTotal_person" format="#,###,###,###R" type="number"   text="" styles='width:100%;'  /></td>
                        <td colspan=5 align="right"><b>Desciption</b></td>
                        <td colspan=12 align="right"><gw:textbox id="txtDescription" text="" styles='width:100%;' /></td>
                    </tr>
                </table>
             </fieldset>
        </td>
    </tr>
    <tr style="height:2%;" >
        <td >&nbsp;</td>
    </tr>
    <tr  style="height:73%;" >
        <td colspan=50>     
            <fieldset style="height:90%;" > 
            <legend><font color="#e9361d" size="2" >Detail Recruitment</font></legend>
            <br />
                <table width="100%" id="Table1" style="height:94%" border=0 cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
	                            <table name="Companion" width=100% cellpadding=0 cellspacing=1 border=1 id="tblexp" style="height:100%" >
                                    <tr style="width:100%;height:5%" valign="top"  >
                                        <td>
                                            <table name="Companion" width=100% cellpadding=0 cellspacing=1 border=1 id="Table2" style="height:100%" >
                                                <tr style="width:100%;height:5%" valign="top"  >
                                                    <td width="91%"  align="center" valign="center">
                                                    </td>
                                                    <td width="3%" style="border:0;" align="right" >
                                                     <gw:imgBtn img="new" id="ibtnAdd_C"   alt="Add"  onclick="OnNewDetail(grdRec_detail,12,-1)"/>
                                                    </td>
                                                     <td width="3%" style="border:0;" align="right" >
                                                     <gw:imgBtn img="save" id="ibtnSave_C"    alt="Save"  onclick="OnSaveDetail(datRecDetail)"/>
                                                    </td>
                                                    <td width="3%" style="border:0;" align="right" >
                                                     <gw:imgBtn img="delete" id="ibtnDelete_C"    alt="Delete"  onclick="OnDeleteDetail(grdRec_detail)"/>
                                                    </td>
                                                </tr>
                                                <tr style=";width:100%;height:90%" valign="top">
                                                    <td colspan=4 style="width:100%" border=1> 
                                                         <gw:grid   
                                                            id="grdRec_detail"  
                                                            header="Employee(s)|Emp Male|Emp Female|Position|Education|Experience (Years)|Height|Weight|Major|Area|Shift Working|Language|Language Certificate|Computer Skill|Other|Remark|_Master_PK|_pk|Approver Remark|_Status"   
                                                            format="-0|0|0|0|0|0|0|0|0|2|2|0|0|0|0|0|0|0|0|0"  
                                                            aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                                            defaults="||||||||||||||||||"  
                                                            editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0"  
                                                            widths="1500|1500|1500|2000|2000|2000|1500|1500|1500|1500|1500|2000|2000|2000|3000|2500|0|0|2500|0"  
                                                            styles="width:100%; height:100%"   
                                                            sorting="T"   oncelldblclick="show_popup()"
                                                            onbeforeedit= "OnChange(1)"
                                                            /> 
                                                    </td>

                                                </tr>
                                            </table> 
                                        </td>
                                    </tr>
                                </table> 
	                           
                                </table> 
                        </td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
</table>
<gw:textbox id="txtApplicant_PK" styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none"/>
<gw:textbox id="txtApprover_PK" styles="display:none"/>
<gw:textbox id="txt_Status_code" styles="display:none" />



<gw:textbox id="txtApp_Type"  styles="display:none"/>
<gw:textbox id="txtTmp"  styles="display:none"/>
<gw:textbox id="txtCompany"  styles="display:none"/>
<gw:textbox id="txtResult"  styles="display:none"/>
<gw:textbox id="txtMaker"  styles="display:none"/>
<gw:textbox id="txtorg_pk"  styles="display:none"/>



</body>



