<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

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
function BodyInit()
{ 	
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";    
    idMon_fr4.text=IDMonth4.value+"01";
    idMon_to4.text=IDMonth4.value+""+getDaysInMonth(IDMonth4.value);
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
          datUser_info.Call();     	    
	else
	     datDaily_check.Call();
    
}
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 idBtnProcess.text= Math.round((d.valueOf()-start)/x);

}
function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
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
function OnDataReceive(obj)
{
    if(obj.id=="datUser_info")
    {
        datDaily_check.Call();
    }
    else if(obj.id=="datFind_Report")
    {
          if(rpt_no==1)
            {
                var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + IDDate.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value;
                    
             }   
           else if(rpt_no==2)
             {
                 var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + lstReport2.GetControl().options.selectedIndex+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value;
             
             }
           else if(rpt_no==3)
             {
                     var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + IDDate3.value+'&p_2=' + IDDate3.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value;
             }
          
         else if(rpt_no==4)
             {
                 var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + IDMonth4.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value+'&p_from='+idMon_fr4.text+'&p_to='+idMon_to4.text;
             }
		else if(rpt_no==5)
             {
                     var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + IDDate5_f.value+'&p_2='+IDDate5_t.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value;
             }
        else if(rpt_no==6)
             {
                     var url=System.RootURL + '/reports/hd/ah/'+txtReport_tmp.text+'?p_1=' + IDYear6.value+'&p_nation='+lstNation.value+'&p_org='+lstOrg_Code.value+'&p_status='+lstStatus.value;
             }     
         window.open(url);    
       }
    
    
}
function on_process()
{
    if(confirm("Do you want to "+idBtnProcess.text+" ?"))
    {
        set_Interval(100);
        datDaily_calculate.Call();
    }    
        
}

function OnPrint(n)
{
    rpt_no=n;
    var check=0;
    if(n==1)
     {
            if(txtflag_tmp.text=='0')
            {
                check=1;
                alert("This date hasn't been calculate, please open form HR.13.16 Daily cost to calculate first.\n Ngày này chưa được process, vui lòng mở form HR.13.16 để tính trước")
            }
            txtReport_tmp.text=lstReport1.value;
     }   
     else if(n==2)
     {
          txtReport_tmp.text=lstReport2.value;
     }
     else if(n==3)
     {
        txtReport_tmp.text=lstReport3.value;
     }
     else if(n==4)
     {
        txtReport_tmp.text=lstReport4.value;
     }
     else if(n==5)
     {
        txtReport_tmp.text=lstReport5.value;
     }
     else if(n==6)
     {
        txtReport_tmp.text=lstReport6.value;
     }
     if(check==0)
        datFind_Report.Call();  
        
}

function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
{
   // returns the last day of a given month
    var m,y,tmpDate,checkMonth,lastDay
	
	m = Number(yyyymm.substr(4,2))-1;
		if(m==-1)
			m=Number(yyyymm.substr(5,1))-1;

	y = Number(yyyymm.substr(0,4));
	tmpDate = new Date(y, m, 28);
	checkMonth = tmpDate.getMonth();
	lastDay = 27;

    while(lastDay <= 31){
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++
    }
    return lastDay;
}

function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:no;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg_Code.value=obj
        
    }
    
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
.topleftright { border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-right:1px solid #034D72; }			
	
#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }

</style>

<body>

<!------------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg_Code" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datGet_Period" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_SAL_PERIOD" > 
                <input >
                    <input bind="IDMonth4" /> 
                    <input bind="lstPeriod4" />
					 <input bind="lstCompany_Code" />					
                </input>
                <output >
                    <output bind="idMon_fr4" /> 
                    <output bind="idMon_to4" /> 
                    <output bind="idnum_day4" />
                    <output bind="idClose_flag4" />  
                </output>
            </dso> 
        </xml> 
</gw:data>

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

<gw:data id="datDaily_check" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR__PRO_CO_DAILY_COST_CHECK" > 
                <input>
                    <input bind="IDDate" /> 
                </input> 
                <output>
                    <output bind="txtflag_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!--------------------main table--------------------------------->

<form name="General Reports" id="Salary" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:100%"   align="center" border="0" >
	<tr height="100%" >
      <td style="width:100%">
      <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:10%"  border="0" >
            <tr>
                <td width="10%"   align="right"  class="topleft" style="font-family:Times New Roman"><font size="4" color="cc0066">&nbsp;</font></td>
                <td width="10%"   align="center"  class="top" style="font-family:Times New Roman"><font size="4" color="cc0066">&nbsp;</font>
                 </td>
                 <td width="10%"   align="right"  class="top" style="font-family:Times New Roman"><font size="4" color="cc0066">&nbsp;</font></td>
                <td width="10%"   align="center"  class="top" style="font-family:Times New Roman"><font size="4" color="cc0066">&nbsp;</font>
                 </td>
                <td width="30%"  align="center"  class="top" style="font-family:Times New Roman"><font size="4" color="cc0066">&nbsp;</font></td>
                <td width="10%"  align="center"  class="top" style="font-family:Times New Roman"><font size="2" >Company</font></td>
                <td width="20%"  align="center"  class="topright" style="font-family:Times New Roman"><font size="4" color="cc0066"><gw:list  id="lstCompany_Code" value='' maxlen = "100" styles='width:100%'onchange="" >
                            <data>
                                <%= CtlLib.SetListDataSQL("select a.pk,A.PARTNER_NAME from tco_company a where a.del_if=0 and a.pk =nvl('"+ Session("COMPANY_PK") +"',a.pk) order by a.pk")%>
                            </data>
                        </gw:list>
                </td>
            </tr>
			
			<tr>
                <td width="10%"   align="right"  class="left" style="font-family:Times New Roman"><font size="4" color="cc0066">Nation</font></td>
                <td width="10%"   align="center"  class="" style="font-family:Times New Roman"><font size="4" color="cc0066"><gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' >
                                <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm" )%>|ALL|Select All</data></gw:list></font>
                 </td>
                 <td width="10%"   align="right"  class="" style="font-family:Times New Roman"><font size="4" color="cc0066">Status</font></td>
                <td width="10%"   align="center"  class="" style="font-family:Times New Roman"><font size="4" color="cc0066"><gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:100%' >
                                <data>|A|Active|R|Resign|ALL|Select All</data></gw:list></font>
                 </td>
                <td width="30%"  align="center"  class="" style="font-family:Times New Roman"><font size="4" color="cc0066">Manager General Reports</font></td>
                <td width="10%"  align="center"  class="" style="font-family:Times New Roman"><font size="4" ><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff" style="text-decoration: none; color=#0000ff" >Oganization</a></font></td>
                <td width="20%"  align="center"  class="right" style="font-family:Times New Roman"><font size="4" color="cc0066"><gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
                            <data>
                                <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                            </data>
                        </gw:list>
                </td>
            </tr>
			
        </table>
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:90%"  border="0" >
        <tr style="height:1%">
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
                <td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
            </tr>
            <tr style="height:10%">
                <td colspan="15"  align="left"  class="topleft" style="font-family:Times New Roman"><font size="3" >Daily Cost</font></td>
                <td colspan="2"  align="left"  class="top" style="font-family:Times New Roman"><gw:datebox id="IDDate"   maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" onchange="datDaily_check.Call()" /></td>
                <td colspan="3"  align="right"  class="top" >&nbsp;</td>
                <td colspan=5 width="10%" align=right class="top">&nbsp;</td>
                <td colspan="5"  align="center"  class="top" style="font-family:Times New Roman">&nbsp;</td>
                <td colspan="5"  align="right"  class="top" >Report by</td>
                <td colspan="10"  align="left"  class="top"><gw:list  id="lstReport1" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='1' order by seq")%></data>
			            </gw:list></td>
                <td colspan="5"  align="center"  class="topright" style="font-family:Times New Roman"><gw:button img="excel" id="ibtnReport"   alt="Report" text="Report"  onclick="OnPrint(1)"/></td>
            </tr>
             <tr style="height:10%">
                <td colspan="15"  align="left"  class="left" style="font-family:Times New Roman"><font size="3" >Statistic Reports (I)</font></td>
                <td colspan="10"  align="left"  style="font-family:Times New Roman"><gw:list  id="lstReport2" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='2' order by seq")%></data>
			            </gw:list></td>
                <td  colspan="10"  align="left"  style="font-family:Times New Roman">&nbsp;</td>
                <td  colspan="10"  align="left"  style="font-family:Times New Roman">&nbsp;</td>
                <td colspan="5"  align="center"  class="right" style="font-family:Times New Roman"><gw:button img="excel" id="ibtnReport2"   alt="Report" text="Report"  onclick="OnPrint(2)"/></td>
            </tr>
            <tr style="height:10%">
                <td colspan="15"  align="left"  class="left" style="font-family:Times New Roman"><font size="3" >Statistic Reports (II) - Daily</font></td>
                <td colspan="10"  align="left"   style="font-family:Times New Roman"><gw:list  id="lstReport3" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='3' order by seq")%></data>
			            </gw:list></td>
                <td colspan="5"  align="right"  >Current Date</td>
                <td colspan="5"  align="left"  style="font-family:Times New Roman"><gw:datebox id="IDDate3"   maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" /></td>
                <td colspan="10"  align="left">&nbsp;</td>
                <td colspan="5"  align="center"  class="right" style="font-family:Times New Roman"><gw:button img="excel" id="ibtnReport3"   alt="Report" text="Report"  onclick="OnPrint(3)"/></td>
            </tr>
            <tr style="height:10%">
                <td colspan="15"  align="left"  class="left" style="font-family:Times New Roman"><font size="3" >Statistic Reports (III) - Monthly</font></td>
                <td colspan="10"  align="left"   style="font-family:Times New Roman"><gw:list  id="lstReport4" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='4' order by seq")%></data>
			            </gw:list></td>
                <td colspan="5"  align="right"  >Current Month</td>
                <td colspan="5"  align="left"  style="font-family:Times New Roman"><gw:datebox id="IDMonth4"   maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>" type=month onchange="datGet_Period.Call()" /></td>
                <td colspan="10"  align="left"><gw:list  id="lstPeriod4" value="02" styles="color:blue;width:100%" onchange="datGet_Period.Call()"> 
					             <data>|01|By Period|02|By Month</data>
			            </gw:list></td>
                <td colspan="5"  align="center"  class="right" style="font-family:Times New Roman"><gw:button img="excel" id="ibtnReport4"   alt="Report" text="Report"  onclick="OnPrint(4)"/></td>
            </tr>
            <tr style="height:10%">
                <td colspan="15"  align="left"  class="left" style="font-family:Times New Roman"><font size="3" >Statistic Reports (IV) - Period</font></td>
                <td colspan="10"  align="left"   style="font-family:Times New Roman"><gw:list  id="lstReport5" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='5' order by seq")%></data>
			            </gw:list></td>
                <td colspan="5"  align="right"  >From Date</td>
                <td colspan="5"  align="left"  style="font-family:Times New Roman"><gw:datebox id="IDDate5_f"   maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>"  /></td>
                <td colspan="1"  align="left"  style="font-family:Times New Roman"><b>~</b></td>
                <td colspan="5"  align="left"  style="font-family:Times New Roman"><gw:datebox id="IDDate5_t"   maxlen = "10" styles='width:100%'lang="<%=Session("Lang")%>"  /></td>
                <td colspan="4"  align="left"   style="font-family:Times New Roman">&nbsp;</td>
                <td colspan="5"  align="center" class="right" style="font-family:Times New Roman"><gw:button img="excel" id="ibtnReport5"   alt="Report" text="Report"  onclick="OnPrint(5)"/></td>
            </tr>
           
            <tr style="height:10%">
                <td colspan="15"  align="left"  class="left" style="font-family:Times New Roman"><font size="3" >Statistic Reports (V) - Yearly</font></td>
                <td colspan="10"  align="left"  style="font-family:Times New Roman"><gw:list  id="lstReport6" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hdah00080' and char_4='6' order by seq")%></data>
			            </gw:list></td>
                <td colspan="5"  align="right" ><b>Current Year</b></td>
                <td colspan="5"  align="left"  style="font-family:Times New Roman"><gw:datebox id="IDYear6"   maxlen = "10" styles='display:none;width:100%'lang="<%=Session("Lang")%>" type=year /></td>       
                <td colspan="5"  align="left"  >&nbsp;</td>
                <td colspan="5"  align="left"   style="font-family:Times New Roman">&nbsp;</td>
                <td colspan="5"  align="center" class="right" ><gw:button img="excel" id="ibtnReport6"   alt="Report" text="Report"  onclick="OnPrint(6)"/></td>
            </tr>
            <tr style="height:39%">
                <td colspan="50"  align="left"  class="topleft" style="font-family:Times New Roman">&nbsp;</td>   
            </tr>
        </table>
      </td>
    </tr>
    	
 </table>
</form>

<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtflag_tmp" styles="display:none"/>

<gw:textbox id="idnum_day4" styles="display:none"/>
<gw:textbox id="idClose_flag4" styles="display:none"/>
<gw:textbox id="idMon_fr4" styles="display:none"/>
<gw:textbox id="idMon_to4" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  

</body>
</html>

