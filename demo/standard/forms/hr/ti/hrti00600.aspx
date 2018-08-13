<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time
var ajax_test;
var v_fac=0;
var process_flag=1;
var root_temp="";


var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";

	var data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg1.SetDataText(data);
	
	idBtnProcess.SetEnable(1);

	//idEmp_id.SetEnable(0);
	
    menu_id.text=System.Menu.GetMenuID();

    ChangeColorItem(lstOrg1.GetControl());

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
//-----------------------------------------------
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
 var d = new Date()
 idInterval_M.text= Math.round((d.valueOf()-start)/x);

}

function getSysDate()
{
	var sysDate,t1,t2,t3
		sysDate = new Date();
		t1=sysDate.getDate()
		t2=(sysDate.getMonth() + 1)
		t3 = sysDate.getFullYear() 
		fullDate = t1 + "/" + t2 + "/" + t3
		return fullDate
	
}
function return_result()
{
	var t=GetRequestState(ajax_test);
	
	if(GetRequestState(ajax_test))
		{
			
			var result= ajax_test.responseText;
			
			if(result.substring(0,5)=="ERROR")
			{
				alert(result);
				clear_Interval(idInterval);
				idInterval.text=(v_language =="ENG")?"Not Complete!":"Không thành công";
			}	
			else if(result=="1")
			{
				idInterval.text=""
				alert((v_language =="ENG")?"Load data complete ! ":"Thành công")
				clear_Interval(idInterval)
				
			}
			else
			{
				alert(result)
				alert("Load data Error!")
				clear_Interval(idInterval)
				idInterval.text="Not Complete!"
			}		
			idBtnProcess.SetEnable(1);
			process_flag=0;
		}			
}
function onClickOption(n)
{
    if(n==1)
	    idBtnProcess.SetEnable(1)
	else    
	    idBtnProcess_M.SetEnable(1)
}
function on_Process()
{
	
	if(!confirm((v_language =="ENG")?"Processing, click OK to continue ":"Tiến trình bắt đầu, bấm OK để tiếp tục"))
	{
		process_flag=0;
		return;
	}    

	txdt_tmp.text=idWorkFrom.value;

	process_1.Call();
}
function on_Delete()
{
	
	if(confirm((v_language =="ENG")?"Do you want to delete?":"Bạn thực sự muốn xóa dữ liệu?"))
	{
		
		idWorkFrom_tmp.text=idWorkFrom.value;
		idWorkTo_tmp.text=idWorkTo.value;
		
		process_flag=1;
		process_del.Call();
	}    
	
}
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "datCheck_View":
        {
            if(txtFlag_View.text == 'Y')
            {
               idBtnProcess.style.display = "none";
               idBtnProcess_M.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }
            else
                process_flag=0;
            
        }
        break;

        case "datUser_info":
            lstOrg1.SetDataText(txtFact_pk.text);
            ChangeColorItem(lstOrg1.GetControl());

            process_flag=0;
		    break;

        
        
		case "process_1":
            if(txtResult.text=="0")//success
		    {
			    txtResult.text=="";
			    //clear_Interval(idInterval);
			  
				idStaus1.text= (v_language =="ENG")?"Step 2 is processing":"Đang xử lý bước 2";
			    //set_Interval(100);
			    process_2.Call();
		    }
		    else if(txtResult.text=="1")//da dong du lieu
		    {
		        alert((v_language =="ENG")?"Data is closed, Can not processing":"Dữ liệu đã đóng, không thể thực hiện");
		        clear_Interval(idInterval);
				 idStaus1.text="Data closed.";
		        idBtnProcess.SetEnable(1)
		        process_flag=0;
		    }
            else
            {
                alert((v_language =="ENG")?"Have fail, Not successful":"Có lỗi xãy ra, Tiến trình không thành công");
		        clear_Interval(idInterval);
				 idStaus1.text=(v_language =="ENG")?"Step 1 fails":"Lỗi tại bước 1";
		        idBtnProcess.SetEnable(1)
		        process_flag=0;
            }
		    break;    
		case "process_2": 
		    if(txtResult.text=="0")//success
		    {
			    txtResult.text=="";
			    clear_Interval(idInterval);
			   // alert("Step 2 success, Step 3 will continous...\n Bước 2 thành công, bước 3 được tiếp tục... ");
			   idStaus1.text=(v_language =="ENG")?"Step 3 is processing":"Đang xử lý bước 3";
			    set_Interval(100);
			    process_3.Call();
		    }   
		     else
		    {
		        alert((v_language =="ENG")?"Have fail, processing not successful":"Có lỗi xãy ra, Tiến trình không thành công");
		        clear_Interval(idInterval);
				idStaus1.text=(v_language =="ENG")?"Step 2 fails":"Lỗi tại bước 2";
		        idBtnProcess.SetEnable(1)
		        process_flag=0;
		    }
		    break;
	    case "process_3": 
		    if(txtResult.text=="0")//success
		    {
			    txtResult.text=="";
			    clear_Interval(idInterval);
				idStaus1.text=(v_language =="ENG")?"Step 4 is processing":"Đang xử lý bước 4";
			    set_Interval(100);
			    process_4.Call();
		    }   
		     else
		    {
		        alert((v_language =="ENG")?"Have fail, processing is not successful":"Có lỗi xãy ra, Tiến trình không thành công");
		        clear_Interval(idInterval);
				idStaus1.text=(v_language =="ENG")?"Step 3 fails":"Lỗi tại bước 3";
		        idBtnProcess.SetEnable(1)
		        process_flag=0;
		    }
		    break;
		case "process_4": 
		    if(txtResult.text=="0")//success
		    {
                if(txdt_tmp.text!=idWorkTo.value) //month
                {
                    idStaus1.text=txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4)+ (v_language =="ENG")?" Process Finish...":" Thành công";

                    txdt_tmp.text=next_day(txdt_tmp.text); //yyyymmdd
                    clear_Interval(idInterval);
    				
                    idStaus2.text=(v_language =="ENG")? "Date: ":"Ngày : " + txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4);
                     set_Interval(100);
                    process_1.Call();
                }
                else
                {

			        txtResult.text=="";
			         clear_Interval(idInterval);
                     idStaus1.text=(v_language =="ENG")?"Successfull":"Thành công";
			        alert((v_language =="ENG")?"Processing is successful":"Tiến trình đã thực hiện thành công");
				   
                }
		    }   
		     else
		    {
		        alert((v_language =="ENG")?"Have fails, Processing is not successful":"Có lỗi xãy ra, Tiến trình không thành công");
		        clear_Interval(idInterval);
		    }
		    idBtnProcess.SetEnable(1)
		    process_flag=0;
		    break;    
		case "process_5": 
		    if(txtResult.text=="0")//success
		    {
			    txtResult.text=="";
			    clear_Interval(idInterval);
			    alert((v_language =="ENG")?"Processing is successful":"Tiến trình đã thực hiện thành công");
		    }   
		     else
		    {
		        alert((v_language =="ENG")?"Have fails, Processing is not successful":"Có lỗi xãy ra, Tiến trình không thành công");
		        clear_Interval(idInterval);
		    }
		    idBtnProcess.SetEnable(1)
		    process_flag=0;
		    break;        
		case "process_del": 
		    if(txtResult.text=="0")//success
		    {
			    alert((v_language =="ENG")?"Delete successful":"Đã xóa thành công");
				idStaus1.text=(v_language =="ENG")?"Delete successful":"Xóa thành công";
		    }   
		    else 
		    {
		        alert((v_language =="ENG")?"Have fails":"Có lỗi xảy ra.");
		    }
		    idBtnProcess.SetEnable(1)
		    process_flag=0;
		    break;   
    }
	
}
function OnDataError(obj) 
{
	if(obj.id == "process_1")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }/**/
	if(obj.id == "process_del")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
}
function OnShowPopup()
{
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00700.aspx" ;
    var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	if (obj!=null)
    {
        txt_emp_pk.text=obj[0];
	    idEmp_id.text=obj[1];
    }
    else
    {
         idEmp_id.text="";
        txt_emp_pk.text="";
    }
}

function onChange_org()
{
    //if(lstCompany.value!='ALL')
    
    datWorkGroup_info.Call();
}

function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}



function add_zero(n) {
    if(Number(n)<=9)
        return '0'+n;
    else 
        return n;
}

function next_day(dt) //yyyymmdd
{
    var ng,th,nam,tmp;
    nam=dt.substr(0,4);
    th=dt.substr(4,2);
    ng=dt.substr(6,2);

    tmp=add_zero(Number(ng)+1);
   // alert(daysInMonth(th,nam));
    if(tmp>daysInMonth(th,nam))
    {
        ng="01";
        th=add_zero(Number(th)+1);
        if(th>12)
        {
            th="01";
            nam= Number(nam)+1;
        }
        
    }
    else
        ng=tmp;
    return nam+""+th+""+ng;

}
function OnChangeDate()
{
	if(idWorkFrom.value != idWorkTo.value )
	{
		idWorkTo.value = idWorkFrom.value;
	}
}
</script>
<style>
.top { border-top:2px solid #034D72; }
.topright { border-top :2px solid #034D72;
			border-right: 2px solid #034D72;;padding-right:10px
			}
.topleft {border-left:2px solid #034D72; 
			border-top :2px solid #034D72;
			}
.left { border-left:2px solid #034D72; }
.right { border-right:2px solid #034D72;padding-right:10px }
.bottomright { border-bottom:2px solid #034D72; 
				border-right:2px solid #034D72; padding-right:10px
				}
.bottomleft { border-bottom:2px solid #034D72; 
				border-left:2px solid #034D72;;
			}
.bottomleftright { border-bottom:2px solid #034D72; 
				border-left:2px solid #034D72;;
				border-right:2px solid #034D72;;
			}			
.bottom { border-bottom:2px solid #034D72; }

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
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtFact_pk" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGetOrg" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_hr_sel_co_user_role3"  > 
                <input>
                    <input bind="lstCompany" />
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txt_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="process_1" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_0" > 
                <input>
                    <input bind="txdt_tmp" />
                     <input bind="lstOrg1" />
                     <input bind="lstCompany" />
                     <input bind="idEmp_id" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="process_2" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_1" > 
                <input>
                    <input bind="txdt_tmp" />
                     <input bind="lstOrg1" />
                     <input bind="lstCompany" />
                     <input bind="idEmp_id" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="process_3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_2" > 
                <input>
                    <input bind="txdt_tmp" />
                     <input bind="lstOrg1" />
                     <input bind="lstCompany" />
                     <input bind="idEmp_id" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="process_4" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_3" > 
                <input>
                    <input bind="txdt_tmp" />
                     <input bind="lstOrg1" />
                     <input bind="lstCompany" />
                     <input bind="idEmp_id" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="process_5" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_4" > 
                <input>
                    <input bind="txdt_tmp" />
                     <input bind="lstOrg1" />  
                     <input bind="idEmp_id" />                   
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="process_del" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00600_5" > 
                <input>
                    <input bind="idWorkFrom_tmp" />
                    <input bind="idWorkTo_tmp" />
                    <input bind="lstOrg1" />
                    <input bind="lstCompany" />
                    <input bind="idEmp_id" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<form name="Time Control" id="form1">
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center"  align="top" class="eco_line">
        <tr style="height:10%" class="eco_bg">
            <td colspan="2">
                <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                    <tr style="height:100%">
			            <td  width="100%" align="center"><b style="font-size=20; color:Green">DAILY WORKING TIME PROCESS</b></td>
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
                            <table  style="width:80%;height:10%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    <tr >
				                    
                                    <td class="" width="10%" align="right" style="white-space:nowrap">From Date</td>
                                    <td class="" width="10%"><gw:datebox id="idWorkFrom" onChange="OnChangeDate()" lang="<%=Session("Lang")%>" styles="width:50%" ></gw:datebox></td>	
                                    <td class="" width="10%" align="right" >To Date</td>
                                    <td class="" width="10%"><gw:datebox id="idWorkTo" lang="<%=Session("Lang")%>" styles="width:50%" ></gw:datebox></td>	
                                    <td class="" width="20%" align="right">
										<a class="eco_link" title="Click here to choose" onclick="OnShowPopup()" href="#tips" style="text-decoration: none;" class="eco_link">Emp ID:</a>
									</td>		
				                    <td class="" width="25%">
                                        <gw:textbox id="idEmp_id" styles="width:100%" />
                                    </td>
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="eco_line_t" style="padding-top:10px">
                            <table style="width:80%;height:30%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >	
			                    <tr >
				                    <td   align="right" width="10%" >Company</td>
									<td  colspan=2 align="left" class="" width="50%">
                                        <gw:list  id="lstCompany" styles='width:100%' onchange="onChange_org()" >
                                            <data>
                                                <%= CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
                                            </data>
                                        </gw:list>
                                    </td>
				                    <td colspan=3 class="" width="40%"><gw:list  id="lstOrg1"  value="ALL" styles='width:100%' onchange="" />
                                    </td>
			                    </tr>	
			                    
			                    <tr >
				                    <td class="" width="10%" align="left">&nbsp;</td>
				                    <td colspan=2 width="50%" align="left" style="color=Black"></td>
				                    <td colspan=3 class="" width="40%"> </td>
			                    </tr>	
			                    <tr >
				                    <td class="" width="10%" align="left" valign=bottom>&nbsp;</td>			
				                    <td  align="center" style="width:15%"><gw:button id="idBtnProcess" img="process" text="Process" onclick="on_Process();return false;" /></td>
									<td  align="center" style="width:15%"><gw:button id="idBtnDelete" img="delete" text="Delete" onclick="on_Delete();return false;" /></td>
				                    <td  align="left"  style="width:20%"><gw:label id="idStaus2" text="" styles="width:100%;color:blue" ></gw:label></td>
                                    <td   style="width:30%" align="left"><gw:label id="idStaus1" text="" styles="width:100%;color:blue" ></gw:label></td>
				                    <td class=""  style="width:30%" align="right"style="color=#FF3300"><gw:label id="idInterval" text="" styles="width:100%" ></gw:label></td>
			                    </tr>
	                            <tr >
				                    <td class="" width="10%" align="left" valign=bottom>&nbsp;</td>			
				                    <td class="" align="center" style="width:10%">&nbsp;</td>
				                    <td class="" align="left"  style="width:20%" align="right">&nbsp;</td>
                                    <td class=""  style="width:30%" align="left">&nbsp;</td>
				                    <td class=""  style="width:30%" align="right"style="color=#FF3300">&nbsp;</td>
			                    </tr>
		                    </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txt_check" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtFact_pk" styles="display:none"/>
<gw:textbox id="txtCompany_pk" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/>
<gw:textbox id="txdt_tmp" styles="display:none"/>
<gw:textbox id="idWorkFrom_tmp" styles="display:none"/>
<gw:textbox id="idWorkTo_tmp" styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="txt_tmp" text="" styles="display:none"  />
<gw:textbox id="txt_emp_pk" text="" styles="display:none"  />

<gw:list  id="lst_file_name" styles="display:none">
                            <data><%=CtlLib.SetListDataSQL("SELECT CODE,CHAR_2 FROM VHR_HR_CODE WHERE ID='HR0032'")%></data></gw:list>
<gw:list  id="lst_temp" styles="display:none">
                            <data><%=CtlLib.SetListDataSQL("SELECT NUM_1,NUM_1 FROM VHR_HR_CODE WHERE ID='HR0031'")%></data></gw:list>                            

</html>