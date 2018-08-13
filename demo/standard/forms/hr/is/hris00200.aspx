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
var process_flag=0;
var root_temp="";
var count_flag=0;
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    
    //if (v_language!="ENG")
        System.Translate(document);
    txtUse_for.text="INSURANCE PROCESS";
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>"; 
   menu_id.text=System.Menu.GetMenuID(); 
   idFrom.SetEnable(0);
   idTo.SetEnable(0);
   dtFromDt.SetEnable(0);
   dtToDt.SetEnable(0);
   
   datCheck_View.Call();

   
}

function set_Interval(x,objint) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + "," + objint + ")",x);
}
function clock(start,x,objint) 
{
 var d = new Date()
 objint.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}


function onchange_month(obj)
{
	obj.Call();
}

function OnDataReceive(obj)
{
    switch (obj.id)
    {
       case "datCheck_View":
       {
            if(txtFlag_View.text == 'Y')
            {
                idBtnProcess.SetEnable(false);
                idBtnDelete1.SetEnable(false);

                idBtnProcess_1.SetEnable(false);
                idBtnDelete2.SetEnable(false);
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
            {
                    datCompany_info.Call(); 
            }
            else
                datGet_List_Kind.Call();
            
            break;
       }
       case "datCompany_info":
       {
            lst_company.SetDataText(txtdept_temp.text);
            lst_company_R.SetDataText(txtdept_temp.text);
            datTimes_info.Call();
            break;
       }
       case "datTimes_info":
       {
            datGet_List_Kind.Call();
            break;
       }
	   case "datGet_Location_dept": 
	   {
	        lstLocation_dept.text=txtLocation.text;
	        lstLocation_dept_1.text=txtLocation.text;
	   	    datGet_List_Kind.Call();
	        break;     
	   } 
	   case "datIns_from_to": 
	   {
	   	    if(txtTmp.text=='C') //tháng này đã đóng 
		    {
		        idCloseYN.text='Status: Close';
		        idBtnProcess.SetEnable(0);
                idBtnDelete1.SetEnable(0);
		    }
		    else if(txtTmp.text=='Y') //tháng này đã đăng ký 
		    {
		        idCloseYN.text='Status: Open';
		        idBtnProcess.SetEnable(1);
                idBtnDelete1.SetEnable(1);
		    }
            else if(txtTmp.text=='S') //chưa tạo sổ lương
		    {
		        idCloseYN.text="Status: Month salary haven't created";
		        idBtnProcess.SetEnable(0);
                idBtnDelete1.SetEnable(0);
		    }
		    else
		    {
		        idCloseYN.text='Status: Not Register';
		        idBtnProcess.SetEnable(0);
                idBtnDelete1.SetEnable(0);
		    }    
            
            //datGet_List_Kind.Call();
		    if (binit==true)
		        datGetSickPeriod.Call();
		    break;   
	   }   
	   case "datGet_List_Kind": 
	        if(lst_Ins_kind.GetControl().options.length>1)
            {
                lst_Ins_kind.value="ALL";
                datIns_from_to.Call();
            }
            else
                alert("There is no kind in define of insurance.\nChưa có loại bảo hiểm nào được định nghĩa.");
	        break;    
	   case "datProcess_insurance": 
		    if(txtresult.text=='0')
		    {
		        clear_Interval(idInterval);
		        alert("Sucessful.\nThành công.");
		        idInterval.text="Sucessful."
		    }
		    else
		    {
		        clear_Interval(idInterval);
		        alert("Ther is error.\nHệ thống có lỗi.");
		        idInterval.text="Unsucessful.";
		    }
	        break; 
	   case "datProcess_ins_foreigner": 
		    if(txtresult.text=='0')
		    {
		        clear_Interval(idInterval);
		        alert("Sucessful.\nThành công.");
		        idInterval.text="Sucessful."
		    }
		    else
		    {
		        clear_Interval(idInterval);
		        alert("Ther is error.\nHệ thống có lỗi.");
		        idInterval.text="Unsucessful.";
		    }
	        break; 
	   case "datProRegulation":
	        if(txtresult_1.text=='0')
		    {
		        clear_Interval(idInterval_1);
		        alert("Sucessful.\nThành công.");
		        idInterval_1.text="Sucessful."
		    }
		    else
		    {
		        clear_Interval(idInterval_1);
		        alert("Ther is error.\nHệ thống có lỗi.");
		        idInterval_1.text="Unsucessful.";
		    }
	        break; 
	   case "datGetSickPeriod":
	         switch (String(txtresult_1.text))
            {
                case "0":
                {
                    lblCloseYN.text='Status: Not Register';
                    idBtnProcess_1.SetEnable(false);
                    idBtnDelete2.SetEnable(false);
                    break;
                }
                case "1":
                {
                    lblCloseYN.text='Status: Open';
                    idBtnProcess_1.SetEnable(true);
                    idBtnDelete2.SetEnable(true);
                    break;
                }
                case "2":
                {
                    lblCloseYN.text='Status: Close';
                    idBtnProcess_1.SetEnable(false);
                    idBtnDelete2.SetEnable(false);
                    break;
                }
                case "3":
                {
                    lblCloseYN.text="Status: Month salary haven't created";
                    idBtnProcess_1.SetEnable(false);
                    idBtnDelete2.SetEnable(false);
                    break;
                }
            }
            if (binit==true)
                binit=false;
	        break;     
        case "datDel_Regulation":
            if(txtDel_Reg.text =="Y")
                alert("Delete success.\nXóa thành công.");
            else alert("Delete fail.\nXóa có lỗi.");
        break;
        case "datDel_Insurance":
            if(txtDel_Ins.text =="Y")
                alert("Delete success.\nXóa thành công.");
            else alert("Delete fail.\nXóa có lỗi.");
        break;
    }
     
	
}
function on_Process(obj)
{
    if (obj==1)
    {
        if(confirm("Insurance is processing...do you want to continous?\nHệ thống bảo hiểm bắt đầu...Bạn có muốn tiếp tục?"))
        {
            if(lst_Nation.value =='1')  // nguoi viet
            {
                set_Interval(1000,idInterval);
                datProcess_insurance.Call();
            }
            else
            {
                set_Interval(1000,idInterval);
                datProcess_ins_foreigner.Call();
            }
        }    
    }
    else
    {
        if(confirm("Insurance is processing...do you want to continous?\nHệ thống bảo hiểm bắt đầu...Bạn có muốn tiếp tục?"))
        {
            set_Interval(1000,idInterval_1);
            datProRegulation.Call();
        }    
    }
}
function onchange_time()
{
    datGet_List_Kind.Call();
}
function OnDelete(obj)
{
    if(confirm("All data that by hand is 'No' will delete?\nTất cả dữ liệu by hand là 'No' sẽ bị xóa?"))
    {   
        if(obj == "1")
            datDel_Insurance.Call();
        else if(obj == "2")
            datDel_Regulation.Call();
    }
}
function onChange_Company(obj)
{
    if(obj == '1') // change insurance
        datTimes_info.Call();
    else if(obj == '2') // change regulation
        datGetSickPeriod.Call();
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
.topleftright { border-top:2px solid #034D72; 
				border-left:2px solid #034D72;;
				border-right:2px solid #034D72;;
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
.bottomtopleft	{ border-bottom:2px solid #034D72; 
				border-left:2px solid #034D72;;
				border-top:2px solid #034D72;;
			}			
.bottomtopright	{ border-bottom:2px solid #034D72; 
				border-right:2px solid #034D72;;
				border-top:2px solid #034D72;;
			}						
.bottomtop	{ 	border-bottom:2px solid #034D72;
				border-top:2px solid #034D72;;
			}					
.bottom { border-bottom:2px solid #034D72; }

#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }



</style>
<body>
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
<gw:data id="datCompany_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTimes_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_INS_TIMES_LIST"  > 
                <input>
                    <input bind="lst_company" />
                </input> 
                <output>
                    <output bind="lst_times" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datIns_from_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_INS_GET_FROM_TO" > 
                <input>
                    <input bind="lst_company" /> 
                    <input bind="txtUse_for" /> 
                    <input bind="lst_times" /> 
                    <input bind="idWorkMon" />
                    <input bind="lst_Ins_kind" />
                </input> 
                <output>
                    <output bind="idFrom" />
                    <output bind="idTo" />
                    <output bind="txtTmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datGet_List_Kind" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_LIST_INS_KIND" > 
                <input>
                    <input bind="lst_company" />
                    <input bind="lst_times" />
                </input> 
                <output>
                    <output bind="lst_Ins_kind" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datGet_Location_dept" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_HRIS00200_0" > 
                <input>
                    <input bind="iduser_pk" /> 
                </input> 
                <output>
                    <output bind="txtLocation" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:data id="datProcess_insurance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00200_1" > 
                <input>
                    <input bind="lst_company" /> 
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" />
                    <input bind="lstLocation_dept" />
                </input> 
                <output>
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datProcess_ins_foreigner" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00200_2" > 
                <input>
                    <input bind="lst_company" /> 
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" />
                    <input bind="lstLocation_dept" />
                </input> 
                <output>
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datGetSickPeriod" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_SICK_GET_FROM_TO" > 
                <input>
                    <input bind="lst_company_R" /> 
                    <input bind="dtMonth" /> 
                </input> 
                <output>
                    <output bind="dtFromDt" />
                    <output bind="dtToDt" />
                    <output bind="txtresult_1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datProRegulation" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00200_3" > 
                <input>
                    <input bind="lst_company_R" /> 
                    <input bind="dtMonth" /> 
                    <input bind="dtFromDt" />
                    <input bind="dtToDt" />
                    <input bind="lstLocation_dept_1" />
                </input> 
                <output>
                    <output bind="txtresult_1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datDel_Regulation" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00200_4" > 
                <input>
                    <input bind="lst_company_R" /> 
                    <input bind="dtMonth" /> 
                </input> 
                <output>
                    <output bind="txtDel_Reg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datDel_Insurance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00200_5" > 
                <input>
                    <input bind="lst_company" /> 
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" /> 
                    <input bind="lstLocation_dept" /> 
                </input> 
                <output>
                    <output bind="txtDel_Ins" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<form name="Time Control" id="form1">

<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center" border="0" >
<tr>
	<td width="100%" height=100%>
	    <br />
	    <table class="itable"  style="width:60%;height:10%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
	        <tr>
	            
                <td colspan=5 class="topleft" width="65%" align="center" valign=middle><font style="font-size:17; color:Teal">INSURANCE</font></td>
			    
				<td class="top" width="14%" align="right"><b>Company</b></td>
				<td class="topright" width="21%" align="right">
                    <gw:list  id="lst_company" onchange="onChange_Company(1)" maxlen = "100" styles='width:96%' >
                            <data><%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' and a.pk=nvl('" + session("COMPANY_PK") + "',a.pk) order by A.PARTNER_ID")%></data></gw:list>
                </td>
	        </tr>
	    </table>
		<table class="itable"  style="width:60%;height:24%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
                
				<tr >
					<td class="topleft" width="15%" align="right" valign=middle><b>Work Mon </b></td>
					<td class="topleft" width="15%" align="left"><gw:datebox id="idWorkMon" lang="<%=Session("Lang")%>" styles="width:90%" onchange="onchange_month(datIns_from_to)" type=month></gw:datebox></td>
					<td class="topleft" width="10%" align="right"><b>Times </b></td>
					<td colspan=2 class="topleft" width="25%" align="right"><gw:list  id="lst_times" onchange="onchange_time()" maxlen = "100" styles='width:96%' >
                            <data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0042' ORDER BY B.CODE")%></data></gw:list></td>
					<td class="topleft" width="10%" align="right"><b>Kind</b></td>
					<td class="topleftright" width="25%" align="right"><gw:list  id="lst_Ins_kind" onchange="onchange_month(datIns_from_to)" maxlen = "100" styles='width:96%' >
                            <data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0041' ORDER BY B.CODE")%>|ALL|Select All</data></gw:list></td>
				</tr>	
				<tr >
				    <td class="topleft" align="right"><b>Period</b></td>
				    <td class="topleft" align="right"><b>From DT </b></td>
				    <td class="top" ><gw:datebox id="idFrom" lang="<%=Session("Lang")%>" styles="width:90%" nullaccept onchange=""></gw:datebox></td>			
				    <td class="top" align="right"><b>To DT </b></td>
				    <td class="top" ><gw:datebox id="idTo" lang="<%=Session("Lang")%>" styles="width:90%" nullaccept onchange=""></gw:datebox></td>			
				    <td class="topleft" align="right">Nation</td>	
				    <td class="topleftright" align="right">
				        <gw:list  id="lst_Nation" value="1" onchange="" maxlen = "100" styles='width:96%' >
                            <data>|1|Vietnamese|2|Foreigner</data></gw:list>
				    </td>	
			    </tr>
			    <tr >
					<td class="bottomtopleft" align="right" ><b>Location</b></td>
					<td colspan=2 class="bottomtopleft" align="left" ><gw:list  id="lstLocation_dept" value='ALL' maxlen = "100" styles='width:80%' >
                            <data>|ALL|Select All</data></gw:list></td>
                    <td class="bottomtop" align="left" ><gw:button id="idBtnProcess" img="process" text="Process" onclick="on_Process(1)" /></td>
					<td class="bottomtop" align="center"><gw:button id="idBtnDelete1" img="delete" text="Delete" onclick="OnDelete(1)" /></td>
					
					<td colspan=1 class="bottomtopright" align="center"><b style="color=#FF3300"><gw:label id="idInterval" text="" styles="width:100%" ></gw:label></b></td>
                    <td colspan=1 class="bottomtopright" align="center"><gw:label id="idCloseYN"  text="" maxlen = "100" styles="color:blue;width:100%;font-weight: bold;font-size:11" /></td>
				</tr>	
			</table>
		    <br />
	        <table class="itable"  style="width:60%;height:10%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
	            <tr>
	                

                    <td colspan=5 class="topleft" width="65%" align="center" valign=middle><font style="font-size:17; color:Teal">REGULATION</font></td>
			    
				    <td class="top" width="14%" align="right"><b>Company</b></td>
				    <td class="topright" width="21%" align="right">
                        <gw:list  id="lst_company_R" value="ALL" onchange="onChange_Company(2)" maxlen = "100" styles='width:96%' >
                                <data><%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>|ALL|Select All</data></gw:list>
                    </td>
	            </tr>

	        </table>
		    <table class="itable"  style="width:60%;height:24%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
			    <tr >
				    <td class="topleft" width="11%" align="right" valign=middle><b>Work Mon </b></td>
				    <td class="topleft" width="19%" align="left"><gw:datebox id="dtMonth" lang="<%=Session("Lang")%>" styles="width:90%" onchange="onchange_month(datGetSickPeriod)" type=month></gw:datebox></td>
				    <td class="topleft" width="17%" align="right"><b>Period</b></td>
				    <td colspan=2 class="topleft" width="25%" align="center"><gw:datebox id="dtFromDt" lang="<%=Session("Lang")%>" styles="width:90%" nullaccept onchange=""></gw:datebox></td>
				    <td class="topleft" width="5%" align="center"><b>~</b></td>
				    <td class="topleftright" width="25%" align="center"><gw:datebox id="dtToDt" lang="<%=Session("Lang")%>" styles="width:90%" nullaccept onchange=""></gw:datebox></td>
			    </tr>	
			    
		        <tr >
				    <td class="bottomtopleft" align="right" ><b>Location</b></td>
				    <td colspan=2 class="bottomtopleft" align="left" ><gw:list  id="lstLocation_dept_1" value='ALL' maxlen = "100" styles='width:80%' >
                            <data>|ALL|Select All</data></gw:list></td>
                    <td class="bottomtop" align="left" width="10%"><gw:button id="idBtnProcess_1" img="process" text="Process" onclick="on_Process(2)" /></td>
				    <td class="bottomtop" align="center" colspan=1><gw:button id="idBtnDelete2" img="delete" text="Delete" onclick="OnDelete(2)" /></td>
				    <td class="bottomtop" align="center"><b style="color=#FF3300"><gw:label id="idInterval_1" text="" styles="width:100%" ></gw:label></b></td>
                    <td colspan=2 class="bottomtopright" align="center"><gw:label id="lblCloseYN"  text="" maxlen = "100" styles="color:blue;width:100%;font-weight: bold;font-size:11" /></td>
			    </tr>	
		    </table>	
		    
		</td>
	</tr>
</table>
<br />

</form>
</body>



<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txt_allowance_kind" styles="display:none"/>
<gw:textbox id="txtresult" styles="display:none"/>
<gw:textbox id="txtresult_1" styles="display:none"/>
<gw:textbox id="txtUse_for" styles="display:none"/>
<gw:textbox id="txtTmp" styles="display:none"/>
<gw:textbox id="txtLocation" styles="display:none"/>
<gw:textbox id="txtDel_Reg" styles="display:none"/>
<gw:textbox id="txtDel_Ins" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</html>
