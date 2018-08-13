<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time
var ajax_test;
var v_fac=0;
var process_flag=0;
var root_temp="";
var count_flag=0;
var check_init=0;
var flag_stop=0;

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
   System.Translate_V2(document, System.Menu.GetMenuPS());
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>"; 
   menu_id.text=System.Menu.GetMenuID();
   
   idFrom.SetEnable(false);
   idTo.SetEnable(false);

   grd_chk.style.display='none';

   var data;
   
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstLocation_pk.SetDataText(data);
   ChangeColorItem(lstLocation_pk.GetControl());
 
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstSalaryKind.SetDataText(data);
	
   
   datCheck_View.Call();
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
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}

function set_Interval2(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock2(" + startTime + "," + x  + ")",x);
}
function clock2(start,x) 
{
 
}


function onchange_month()
{
   
    txtResult.text="";
	if(txtProcessSalary.text=="1") 
	    datGet_from_to.Call();
	else if(lstSalaryKind.value!="")
	   {
	    datGet_from_to.Call();
	   }
}
function ChangeSalaryKind()
{  
    txtResult.text="";
  if(lstSalaryKind.value!='')
    { 	
		txtResult.text="";
		datGet_from_to.Call();
	}
}
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "datCheck_View":
          if(txtFlag_View.text == 'Y')
          {
              idBtnProcess.style.display = "none";
              idBtnDelete.style.display = "none";
          }
          else
          {
              if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                     datUser_info.Call(); 
              else                 
                    datGet_from_to.Call();
          }
            break;
        case "datUser_info":
                ChangeColorItem(lstLocation_pk.GetControl());
               datGet_from_to.Call();
               break;
        
		case "datGet_from_to":
              //alert(txtCheckWorkTime.text);
              grd_chk.style.display='none';
		      if(txtResult.text=='Y')
		      {
		        idInterval.text=(v_language=='ENG') ? "This Month Closed":"Tháng này dữ liệu đã đóng";
		        idBtnProcess.SetEnable(0);
		        idBtnDelete.SetEnable(0);
				return;
		      }
		      else if(txtResult.text=="")
		      {
		        idInterval.text=(v_language=='ENG') ?"This Month Not Register":"Tháng này chưa đăng ký";
		        idBtnProcess.SetEnable(0);
		        idBtnDelete.SetEnable(0);
				return;
		      }
		     else if(txtProcess.text=='N')
		        {
		            idInterval.text=(v_language=='ENG') ?"Month Salary haven't create":"Bảng lương tháng chưa được tạo";
		            idBtnProcess.SetEnable(0);
		            idBtnDelete.SetEnable(0);
					return;
		        }
              else if(txtProcess.text=='C')
		        {
		            idInterval.text=(v_language=='ENG') ? "Some Employee not have month salary":"Một số nhân viên chưa được tạo lương tháng";
                    grd_chk.style.display='';
                    datShowDeatail_error.Call("SELECT");
                    return;
		        }
			else if(txtCheckWorkTime.text=='N')
				{
					idInterval.text=(v_language=='ENG') ? "Working month haven't closed":"Công tháng chưa được đóng";
		            idBtnProcess.SetEnable(0);
		            idBtnDelete.SetEnable(0);
					return;
				}
			
		      else
		      {
		        idBtnProcess.SetEnable(1);
		        idBtnDelete.SetEnable(1);
		        txtAllow_count.text="";
		        idInterval.text="";
		       
		      } 
			if(txtCheck_Salary.text == 'Y')
            {
                idInterval.text=(v_language=='ENG') ? "This month have data":"Tháng này đã tồn tại dữ liệu";
		        idBtnProcess.SetEnable(0);
		        idBtnDelete.SetEnable(1);
            }
			else 
			{
				idInterval.text=(v_language=='ENG') ? "This month not have data":"Tháng này chưa có dữ liệu";
		        idBtnProcess.SetEnable(1);
		        idBtnDelete.SetEnable(0);
			}	
		      datGet_allowance.Call();
		    break;    
		 case "datGet_allowance":  
		     check_init=1;   
		     break;   
		 
		case "datProcess_Allowance":  
		    if(txtResult.text=='0')
		    {
		            if(flag_stop==0)
		            {
		                txtResult.text='';
		                
						clear_Interval(idInterval);
						idProcess_status.text=(v_language=='ENG') ? "Task 1 is processing":"Bước 1 đang xử lý";
						set_Interval(1000);
						datProcess_Sal_s1.Call();
	                    
		            }  
		            else    
		            {
		                txtResult.text='';
		                clear_Interval(idInterval);
                        idInterval.text="User Cancel."
                        flag_stop=0;
                        idProcess_status.text="";
		            }  
		    }
		   else
		    {
		        alert("Allowance kind "+count_flag+" uncompleted?\n Phụ cấp loại "+count_flag+" bị lỗi.")
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Uncomplete.":"Không thành công";
                flag_stop=0;
                        idProcess_status.text="";
		    }    
		    break; 
		case "datProcess_Sal_s1": 
		     if(txtResult.text=='0')
		    { 
		        if(flag_stop==0)
                {
                    txtResult.text==''
                    clear_Interval(idInterval);
                    idProcess_status.text=(v_language=='ENG')?"Task 2 is processing":"Bước 2 đang xử lý";
                    set_Interval(1000);
                    datProcess_Sal_s2.Call();
                }
                else
                {
                    txtResult.text='';
		            clear_Interval(idInterval);
                    flag_stop=0;
                    idInterval.text="User Cancel"
                    idProcess_status.text="";
                }
                   
	        }      
	        else
	        {
	            alert("There is error at step 1 of Salary process.\nĐã có lỗi xảy ra ở bước 1 Hệ thống tính lương.")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Salary Step1 Error":"Bước 1 có lỗi";
                flag_stop=0;
                idProcess_status.text="";
                    
	        }
	        break;             
	   case "datProcess_Sal_s2": 
		   if(txtResult.text=='0')
		    { 
		        if(flag_stop==0)
                {
                    txtResult.text==''
                    clear_Interval(idInterval);
                    idProcess_status.text=(v_language=='ENG') ? "Task 3 is processing":"Bước 3 đang xử lý";
                    set_Interval(1000);
                    datProcess_Sal_s3.Call();
                }
                else
                {
                    txtResult.text='';
		            clear_Interval(idInterval);
                    flag_stop=0;
                    idInterval.text="User Cancel"
                    idProcess_status.text="";
                }
                   
	        }      
	        else
	        {
	            alert((v_language=='ENG') ? "There is error at step 2 of Salary process":"Đã có lỗi xảy ra ở bước 2 Hệ thống tính lương")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Salary Step2 Error":"Bước 2 có lỗi";
                flag_stop=0;
                    idProcess_status.text="";
                    
	        }
	        break;    
	   case "datProcess_Sal_s3": 
		   if(txtResult.text=='0')
		    { 
		        alert((v_language=='ENG') ? "Process successful":"Xử lý thành công")
                txtResult.text='';
	            clear_Interval(idInterval);
	            idInterval.text=(v_language=='ENG') ? "Process Successful":"Xử lý thành công";
                flag_stop=0;
                idProcess_status.text="";
				
				idBtnProcess.SetEnable(0);
		        idBtnDelete.SetEnable(1);
	        }      
	        else
	        {
	            alert((v_language=='ENG') ? "There is error at step 3 of Salary process":"Đã có lỗi xảy ra ở bước 3 Hệ thống tính lương")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Salary Step3 Error":"Bước 3 có lỗi";
                flag_stop=0;
                idProcess_status.text="";
	        }
	        break;       
		case "datDel_salary": 
	        if(txtResult.text=='0')
		    {
		        alert((v_language=='ENG') ? "Delete successful":"Xóa dữ liệu lương đã hoàn thành")
                txtResult.text='';
	            idInterval.text=(v_language=='ENG') ? "Delete Successful":"Xóa dữ liệu thành công";  
				idBtnProcess.SetEnable(1);
		        idBtnDelete.SetEnable(0);
		    }
		    else
		    {
		        alert((v_language=='ENG') ? "Have Error":"Đã có lỗi xảy ra");
                txtResult.text='';
	            idInterval.text=(v_language=='ENG') ? "Unsuccessful":"Không thành công";  
		    }
		    break; 
					
		case "datProcess_Allowance_resign":  
            if(txtResult.text=='0')
		    {
		            if(flag_stop==0)
		            {
		                txtResult.text='';
		                clear_Interval(idInterval);
    		            
	                    count_flag+=1;
	                    if(count_flag<=Number(txtAllow_count.text))    
	                    {
	                       txt_allowance_kind.text=grdAllowance.GetGridData(count_flag,0)
                           idProcess_status.text=(v_language=='ENG') ? "Task allowance "+count_flag +" is processing":"Phụ cấp "+count_flag +" đang xử lý";
	                        set_Interval(1000);
	                        datProcess_Allowance_resign.Call();
	                    }   
	                    else
	                    {
	                        clear_Interval(idInterval);
                                idProcess_status.text=(v_language=='ENG') ? "Salary task 1 is processing":"Bước 1 đang xử lý";
	                            set_Interval(1000);
	                            datProcess_Sal_s1_resign.Call();
	                    }
		            }  
		            else    
		            {
		                txtResult.text='';
		                clear_Interval(idInterval);
                        idInterval.text="User Cancel."
                        flag_stop=0;
                        idProcess_status.text="";
		            }  
		    }
		    else
		    {
		        alert((v_language=='ENG') ? "Allowance kind "+count_flag+" uncompleted":"Phụ cấp loại "+count_flag+" bị lỗi.");
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break; 
		
		 
	   case "datProcess_Sal_s1_resign": 
            if(txtResult.text=='0')
		    { 
		        if(flag_stop==0)
                {
                    txtResult.text==''
                    clear_Interval(idInterval);
                    idProcess_status.text=(v_language=='ENG') ? "Salary task 2 is processing":"Bước 2 đang xử lý";
                    set_Interval(1000);
                    datProcess_Sal_s2_resign.Call();
                }
                else
                {
                    txtResult.text='';
		            clear_Interval(idInterval);
                    flag_stop=0;
                    idInterval.text="User Cancel"
                    idProcess_status.text="";
                }
                   
	        }   
	        else
	        {
	            alert((v_language=='ENG') ? "There is error at step 1 of Resign salary process":"Đã có lỗi xảy ra ở bước 1 Hệ thống tính lương")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Salary Step1 Error":"Bước 1 có lỗi";
	        }
	        break;          
	   case "datProcess_Sal_s2_resign": 
            if(txtResult.text=='0')
		    { 
		        if(flag_stop==0)
                {
                    txtResult.text==''
                    clear_Interval(idInterval);
                    idProcess_status.text=(v_language=='ENG') ? "Salary task 3 is processing":"Bước 3 đang xử lý";
                    set_Interval(1000);
                    datProcess_Sal_s3_resign.Call();
                }
                else
                {
                    txtResult.text='';
		            clear_Interval(idInterval);
                    flag_stop=0;
                    idInterval.text="User Cancel"
                    idProcess_status.text="";
                }
                   
	        }   
	        else
	        {
	            alert((v_language=='ENG') ? "There is error at step 2 of resign salary process":"Đã có lỗi xảy ra ở bước 2 Hệ thống tính lương")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ? "Salary Step2 Error":"Bước 2 có lỗi";
	        }
	        break;     
	   case "datProcess_Sal_s3_resign": 
		    if(txtResult.text=='0')
		    { 
		        alert((v_language=='ENG') ? "System Resign  Salary process successful":"Hệ thống lương nghỉ việc đã hoàn thành.")
                txtResult.text='';
	            clear_Interval(idInterval);
	            idInterval.text="Successful."
                idProcess_status.text="";
	        }      
	        else
	        {
	            alert((v_language=='ENG') ?"There is error at step 3 of Resign Salary process":"Đã có lỗi xảy ra ở bước 3 Hệ thống tính lương nghỉ việc.")
	            txtResult.text='';
		        clear_Interval(idInterval);
		        idInterval.text=(v_language=='ENG') ?"Salary Step3 Error":"Bước 3 có lỗi"
	        }
	        break;       
	  case "datDel_salary_resign": 
	        if(txtResult.text=='0')
		    {
		        alert((v_language=='ENG') ?"Delete successful":"Hệ thống xóa lương nghỉ việc đã hoàn thành");
                txtResult.text='';
	            idInterval.text=(v_language=='ENG') ? "Successful":"Thành công";  
		    }
		    else
		    {
		        alert((v_language=='ENG') ?"Have error":"Đã có lỗi xảy ra.")
                txtResult.text='';
	            idInterval.text=(v_language=='ENG') ? "Unsuccessful":"Không thành công";  
		    }
		    break;   
		    
	     
	   
	   case "datCheck_Month_Salary":
          
            grd_chk.style.display='none';
            if(txtProcess.text=='N')
            {
                alert((v_language=='ENG') ? "Month Salary haven't create":"Sổ lương chưa được tạo");
                return;
            }
            if(txtProcess.text=='C')
            {
                if(!confirm((v_language=='ENG') ? "Month Salary has new data not yet create. Do you want to process?":"Có nhân viên chưa có trong sổ lương đã tạo. Bạn muốn tiếp tục?"))
                {
                    grd_chk.style.display='';
                    datShowDeatail_error.Call("SELECT");
                    return;
                }
            }
			if(txtCheckWorkTime.text== 'N')
            {
                alert((v_language=='ENG') ? "Working month haven't closed":"Bảng công tháng này chưa được đóng");
                return;
            }
            
				
			if(txtProcessSalary.text=='1')
				if(confirm((v_language=='ENG') ? "Salary is processing. Do you want to continous ?":"Hệ thống tính lương bắt đầu. Bạn có muốn tiếp tục?"))
				{
					set_Interval(1000)
					idProcess_status.text= (v_language=='ENG') ? "Task 1 is processing":"Bước 1 đang xử lý";
					datProcess_Allowance.Call();
				}
			if(txtProcessSalary.text=='2')
				if(confirm((v_language=='ENG') ? "Resign Salary is processing. Do you want to continous?":"Hệ thống tính lương nghỉ việc bắt đầu. Bạn có muốn tiếp tục?"))
				{
					set_Interval(1000)
					idProcess_status.text=(v_language=='ENG') ? "Task 1 is processing":"Bước 1 đang xử lý";
					datProcess_Allowance_resign.Call();   
				}   
              
	            
			else
		    {
		        alert((v_language=='ENG') ? "Have error":"Đã có lỗi xảy ra.")
                txtResult.text='';
               
	            
		    }
		    break;   
	               
	        
    }

}
function on_Process()
{
    if(check_init==1)
	{
		idInterval.text ="";
		datCheck_Month_Salary.Call();   
	}
    
}
function on_Delete()
{
	idInterval.text ="";
	if(txtProcessSalary.text=='1')
    if(confirm((v_language=='ENG') ? "Do you want to delete data for this month?":"Bạn có muốn xóa dữ liệu đã tính lương trong tháng này?"))
    {
       datDel_salary.Call(); 
    }
if(txtProcessSalary.text=='2')
	 if(confirm((v_language=='ENG') ? "Do you want to delete resign data for this month?":"Bạn có muốn dữ liệu đã tính lương nghỉ việc trong tháng này?"))
    {
       datDel_salary_resign.Call(); 
    }
}

//----------------------------------
function OnShowPopup(n)
{
    
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
		var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {		
			lstLocation_pk.value=obj;
        }
     
        
    
}


function on_Stop()
{
    flag_stop=1;   
}

</script>
<style>
.top { border-top:2px solid #62ac0d; }
.topright { border-top :2px solid #62ac0d;
			border-right: 2px solid #62ac0d;;padding-right:10px
			}
.topleft {border-left:2px solid #62ac0d; 
			border-top :2px solid #62ac0d;
			}
.topleftright { border-top:2px solid #62ac0d; 
				border-left:2px solid #62ac0d;;
				border-right:2px solid #62ac0d;;
			}			
.left { border-left:2px solid #62ac0d; }
.right { border-right:2px solid #62ac0d;padding-right:10px }
.bottomright { border-bottom:2px solid #62ac0d; 
				border-right:2px solid #62ac0d; padding-right:10px
				}
.bottomleft { border-bottom:2px solid #62ac0d; 
				border-left:2px solid #62ac0d;
			}
.bottomleftright { border-bottom:2px solid #62ac0d; 
				border-left:2px solid #62ac0d;
				border-right:2px solid #62ac0d;
			}			
.bottomtopleft	{ border-bottom:2px solid #62ac0d; 
				border-left:2px solid #62ac0d;
				border-top:2px solid #62ac0d;
			}			
.bottomtopright	{ border-bottom:2px solid #62ac0d; 
				border-right:2px solid #62ac0d;
				border-top:2px solid #62ac0d;
			}						
.bottomtop	{ 	border-bottom:2px solid #62ac0d;
				border-top:2px solid #62ac0d;
			}					
.bottom { border-bottom:2px solid #62ac0d; }

#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }



</style>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2" > 
                <input>
                    <input bind="iduser_pk" /> 
                </input> 
                <output>
                    <output bind="lstLocation_pk" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datGet_allowance" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_CO_GET_ALLOW_BY_ORG" procedure=""> 
                <input bind="grdAllowance" >
                   <input bind="lstLocation_pk" /> 
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_from_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
                    <dso  type="process" procedure="ST_HR_SEL_CO_GET_FROMTO_BY_ORG" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="lstLocation_pk" />
                    <input bind="lstSalaryKind" />
                    
                </input> 
                <output>
                    <output bind="idFrom" />
                    <output bind="idTo" />
                    <output bind="txtResult" />
                    <output bind="txtProcess" />
                    <input bind="txtProcessSalary" />
                    <output bind="idSAL_ALL" />
                    <output bind="txtAllow_count" />
                    <output bind="txtCheck_Salary" />
					<output bind="txtCheckWorkTime" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datCheck_Month_Salary" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_CO_GET_FROMTO_BY_ORG" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="lstLocation_pk" />
                    <input bind="lstSalaryKind" />
                    
                </input> 
                <output>
                    <output bind="idFrom" />
                    <output bind="idTo" />
                    <output bind="txtResult" />
                    <output bind="txtProcess" />
                    <input bind="txtProcessSalary" />
                    <output bind="idSAL_ALL" />
                    <output bind="txtAllow_count" />
                    <output bind="txtCheck_Salary" />
					<output bind="txtCheckWorkTime" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Allowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_5" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txt_allowance_kind" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Sal_s1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_6" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Sal_s2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_7" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Sal_s3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_8" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datDel_salary" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_9" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Allowance_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_15" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txt_allowance_kind" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Sal_s1_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_16" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_Sal_s2_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_17" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />                
                    
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>



<gw:data id="datProcess_Sal_s3_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_18" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datDel_salary_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00600_19" > 
                <input>
                    <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="txtExRate" />
                    <input bind="lstSalaryKind" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!--grid check -------------->
<gw:data id="datShowDeatail_error" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_PRO_HRPM00600_20" > 
                <input bind="grdChk" >
                   <input bind="idWorkMon" />
                    <input bind="idFrom" />
                    <input bind="idTo" />
                    <input bind="lstLocation_pk" />
                    <input bind="lstSalaryKind" />
                    <input bind="txtProcessSalary" />
                </input>
                <output  bind="grdChk" />
            </dso> 
        </xml> 
</gw:data>

<form name="Salary" id="form1">
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center"  align="top" class="eco_line">
        <tr style="height:10%" class="eco_bg">
            <td colspan="2">
                <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                    <tr style="height:100%">
			            <td  width="100%" align="center"><b style="font-size=20; color:Green">Monthly Process Salary</b></td>
		            </tr>
                </table>
            </td>
        </tr>
        <tr style="height:90%">
            <td class="eco_line_t" colspan="2" align="center" valign="top">
				<div style="height:30px">&nbsp;</div>
                <table border="0" width="800px"  cellpadding="0" cellspacing="0" class="eco_line">
                   
                    <tr>
                        <td align="center" >
                            <table  style="width:80%;height:6%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    <tr >
				                    <td class="" width="15%" align="right" style="white-space:nowrap">Work Month</td>
									<td class="" width="10%" align="right" style="white-space:nowrap">
										<gw:datebox id="idWorkMon" lang="<%=Session("Lang")%>" styles="width:90%" onchange="onchange_month()" type=month></gw:datebox>
									</td>
									<td class="" width="10%" align="right" style="white-space:nowrap"></td>
                                    <td class="" width="10%" align="right" style="white-space:nowrap">From Date</td>
                                    <td class="" width="10%"><gw:datebox id="idFrom" onChange="OnChangeDate()" lang="<%=Session("Lang")%>" styles="width:50%" ></gw:datebox></td>	
                                    <td class="" width="10%" align="right">To Date</td>
                                    <td class="" width="10%"><gw:datebox id="idTo" lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnchangeDT(2)"></gw:datebox></td>	
                                   
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="eco_line_t" style="padding-top:10px">
                            <table style="width:80%;height:30%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    
			                    <tr >
				                    <td  align="right" width="15%" >Salary Kind</td>
									<td  align="left" width="30%">
                                        <gw:list  id="lstSalaryKind" value='' maxlen = "100" styles='width:100%' onchange="ChangeSalaryKind()" />
                                    </td>
									<td  align="right" align="right" width="15%" >Organization</td>
				                    <td colspan=2 class="" width="30%">
										<gw:list  id="lstLocation_pk" value='ALL'  styles='width:100%' />
                                    </td>
			                    </tr>
			                    <tr >
				                    <td class="" width="10%" align="left">&nbsp;</td>
				                    <td colspan=2 width="50%" align="left" style="color=Black"></td>
				                    <td colspan=4 class="" width="40%"> </td>
			                    </tr>	
			                    <tr >
				                    <td class="" width="10%" align="left" valign=bottom>&nbsp;</td>			
				                    <td  align="center" style="width:15%">
										<gw:button id="idBtnProcess" img="process" text="Process" onclick="on_Process()" />
									</td>
									<td  align="center" style="width:15%">
										<gw:button id="idBtnDelete" img="delete" text="Delete" onclick="on_Delete()" />
									</td>
				                    <td colspan=2  align="left"  style="width:10%">
										 <gw:label id="idInterval" text="" styles="width:100%;color:blue"></gw:label>
										 
									</td>
			                    </tr>
	                            <tr >
				                    <td colspan=5 class="" width="100%" align="center" valign=bottom>
										<gw:label id="idProcess_status" text="" styles="width:100%"  ></gw:label>
									</td>			
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<table id="grd_chk" class="itable"  style="width:80%;height:30%;border-left:0;border-top:0" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
		 <td colspan=10  style="width:100%;height:100%;"> 
							 <gw:grid   
								id="grdChk"  
								header="EMP ID|FULL NAME|JOIN DATE|LEFT DATE|SALARY YN"
								format="0|0|4|4|0"  
								aligns="0|2|2|1|0"  
								defaults="||||"  
								editcol="0|0|0|0|0"  
								widths="2000|3000|2000|2000|1200"  
								styles="width:100%; height:100%" 
								sorting="T" acceptNullDate   
								onafteredit=""
								/> 
		</td>
	   
	</table>
</form>
</body>


<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtProcess" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txt_allowance_kind" styles="display:none"/>
<gw:textbox id="txtAllow_count" styles="display:none"/>
<gw:textbox id="txtProcessSalary" styles="display:none"/>
<gw:textbox id="txtCheckWorkTime" styles="display:none"/>
<gw:textbox id="txtCheck_Salary" styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />

<gw:grid   
    id="grdAllowance"  
    header="Code|Code Name"
    format="0|0"  
    aligns="0|2"  
    defaults="|"  
    editcol="0|0"  
    widths="0|1500"  
    styles="display:none" 
    sorting="T"    
/> 
<gw:textbox id="txtExRate"  styles='width:100%;display:none' text=""/>
<gw:label id="idSAL_ALL" styles="width:100%;display:none" ></gw:label>
</html>

