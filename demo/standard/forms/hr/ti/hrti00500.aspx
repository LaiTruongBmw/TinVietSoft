<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser("man")%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Import General Information Data</title>
</head>

<script>
var dept,grp,flag=0;
var v_language = "<%=Session("SESSION_LANG")%>";
var _days=0;
var tmp1,tmp2,imp_seq;
var flag_save=0;
function BodyInit()
{       
    idMon_fr.SetEnable(0);   
    idMon_to.SetEnable(0);
    //ibtnUpdate.SetEnable(0);
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());

	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00500', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
    //if(idMon.value!="")
	datGet_Period.Call();
}
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}

function clock(start,x) 
{
 var d = new Date()
 lblRecord.text= Math.round((d.valueOf()-start)/x);

}

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}

function OnDataReceive(obj)
{
	if(obj.id=="datImportAttendance")
	{
		lblRecord.text=idGridAtt.rows-1;
		flag_save=0;
		//ibtnUpdate.SetEnable(0);
	}
	
	if(obj.id=="datGet_Period")
	{
	    
	    var n;
	    _days=daysInMonth(idMon_fr.value.substring(4,6),idMon_fr.value.substring(0,4));	
		tmp1=Number(idMon_fr.value.substring(6,8));
		tmp2=Number(idMon_to.value.substring(6,8));
		//alert(tmp2)
		if(tmp2<_days)//chu ky giua thang
		{
		    for(var i=tmp1;i<=31+tmp2;i++)
		    {
		        if(i>31)
		            n=i-31
		         else
		            n=i   
		        idGridAtt.SetGridText(0,i-tmp1+1,n);
		    }    
		    for(var i=1;i<=31-_days;i++)
		    idGridAtt.GetGridControl().ColHidden(i+_days-tmp1+1)=true;
		}
		else
		{
		    for(var i=1;i<=31;i++)
		        idGridAtt.SetGridText(0,i,i);
		        
		    for(var i=1;i<=31-_days;i++)
		    idGridAtt.GetGridControl().ColHidden(i+_days)=true;    
		} 
		
		if(idClose_flag.text=="Y")
			lblRecord.text=(v_language =="ENG")?"This month is close":"Tháng này đã đóng";
		else
		    lblRecord.text="";
		
		txtSequence.text = '';
		OnSearch();
	}	
	if (obj.id=="datFind_Report")
    {	
		if(txtReportCode_tmp.text =="101") //sample
		{	
			var url=System.RootURL + txtReport_tmp.text + '?l_rpt_month=' + idMon.value + "&l_rpt_month_text=" + idMon.text;
		}
		else if(txtReportCode_tmp.text =="102") 
		{
			if (txtSequence.text == '')
			{
				alert("No Data!")
				return;
			}
			var url=System.RootURL + txtReport_tmp.text +'?p_rpt_month=' + idMon.value + "&l_from_dt=" + idMon_fr.value + "&l_to_dt=" + idMon_to.value + "&l_txtSequence=" + txtSequence.text;
		}
	
		window.open(url);
	}
}      

function OnSearch()
{
	datImportAttendance.Call("SELECT");
}


function CheckValidFile(vfile)
{
    var sext;
    sext=vfile.substring(vfile.length-4,vfile.length);
    if (sext!=".xls")
        return false;
    return true;
}

function Remove_empty_rows()
{
  if(idGridAtt.GetGridControl().rows>1)
  {
    var row=idGridAtt.GetGridControl().rows;
    var i=1;
    while(i<row)
    {
        if(idGridAtt.GetGridData(i,0).length<4)
        {   
            idGridAtt.RemoveRowAt(i);
            i-=1;
            row=idGridAtt.GetGridControl().rows;
        }
        i+=1;    
    }
  } 
  
  //clear_Interval(lblRecord);
  
}

function OnChangeMon()
{
	for(var i=1;i<=31;i++)
		    idGridAtt.GetGridControl().ColHidden(i)=false;
	datGet_Period.Call();
}

function daysInMonth(month, year) 
{
    return new Date(year, month, 0).getDate();
}

function OnReport()
{
	txtReportCode_tmp.text = lstReport.value;
	txtOrg_tmp_pk.text="ALL"; 
	
	datFind_Report.Call();
	
}

function OnAttachFile()
{
	
	    set_Interval(100);
	    //datInsert_master.Call();
		var currentTime = new Date();	
			var pro_name = '';
			var url = '';
			txtSequence.text = currentTime.getTime();
			pro_name = 'ST_HR_PRO_HRTI00500_2';
			clear_Interval(lblRecord);
			
			// tham số cố định fixed table_name, procedure, procedure_file	
			// p_1,p_2,p_3,p_4,p_5: phân biệt loại dữ liệu
			url = System.RootURL + '/system/binary/ReadExcel.aspx?import_seq='+ txtSequence.text + '&procedure=ST_HR_PRO_CO_INSERT_IMAGE' 
			+ '&procedure_file=' + pro_name + '&p_1=' + idMon.text + '&p_2=' + idMon_fr.value + '&p_3=' + idMon_to.value + '&p_4=' + '&p_5=' + '&p_cols=34' ;
			
			
			lblRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" ) ;
						
			if (lblRecord.text != 'undefined')
			{
				alert("Imported : " + lblRecord.text );
				flag_save = 1;
				OnSearch();
			}	
			else
				lblRecord.text = '0';
	   
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
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

<gw:data id="datGet_Period" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00500_0" > 
                <input >
					<input bind="lstCompany" /> 
                    <input bind="idMon" /> 
                    <input bind="idLst_period" />
                </input>
                <output >
                    <output bind="idMon_fr" /> 
                    <output bind="idMon_to" /> 
                    <output bind="idnum_day" />
                    <output bind="idClose_flag" />  
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datInsert_master" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00500_1" > 
                <input >
                    <input bind="idMon" /> 
                    <input bind="idMon_fr" />
                    <input bind="idMon_to" />
                </input>
                <output >
                    <output bind="idResult" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datImportAttendance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="ST_HR_SEL_HRTI00500_0" procedure="">
                <input bind="idGridAtt" >
					<input bind="idMon" />
					<input bind="idMon_fr" />
					<input bind="idMon_to" />
					<input bind="txtSequence" />
                </input>                 
                <output bind="idGridAtt" />                
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->

<form name="frmimport" id="form2"  > 
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0"  align="top" class="eco_line">
    <tr style="height:2%" class="eco_bg">
        <td colspan="2">
            <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                <tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=10 width="10%" style="border:0" align="center" >Company</td>
					<td colspan=15 width="15%" style="border:0"> 
						<gw:list  id="lstCompany" value="" maxlen = "100" styles='width:100%' onchange="ChangeOrganization(1)" >
							<data>
								<%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and (a.pk=nvl('" + Session("COMPANY_PK") + "',a.pk) or '" + Session("HR_LEVEL") + "'='6') and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
							</data>
						</gw:list>
					</td>
					<td colspan=10 width="10%" style="border:0" align="center" >
						Month
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:datebox id="idMon" type="month" lang="<%=Session("Lang")%>" onchange="OnChangeMon()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:datebox id="idMon_fr"  lang="<%=Session("Lang")%>" onchange="" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:datebox id="idMon_to"  lang="<%=Session("Lang")%>" onchange="" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="btnAttachFile" img="attach" text="Get file" onclick="OnAttachFile()" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="idBtnRpt1" img="excel" text="Report" alt="Report" onclick="OnReport()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
					</td>
					<td colspan=5 width="5%" style="border:0" align="center" >
						Rows: 
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:label id="lblRecord" ></gw:label>
					</td>
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:98%">
        <td class="eco_line_t">
            <gw:grid   
				id="idGridAtt"   
				header="EmpID|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_WORK_MON|_from|_to|_import_seq"
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				aligns="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0"
				defaults="||||||||||||||||||||||||||||||||||||"
				editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0"
				widths="1000|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|700|1200|1200|1200|0|0" 
				styles="width:100%; height:100% "   
				sorting="T"   
				acceptNullDate
				oncelldblclick=""
				oncellclick = ""/>
        </td>
    </tr>
</table>	        
<gw:textbox id="idnum_day" styles="display:none"/>
<gw:textbox id="idClose_flag" styles="display:none"/>
<gw:textbox id="idResult" styles="display:none"/>
<gw:textbox id="idImp_seq" styles="display:none"/>

<gw:textbox id="txtSequence" styles="display:none"/>		
<gw:textbox id="txtReport_tmp" styles="display:none"/>	
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>	
<gw:textbox id="txtOrg_tmp_pk" styles="display:none"/>	
<gw:list  id="idLst_period" value='01' maxlen = "100" styles='width:100%;display:none' onchange="OnChangeMon()">
    <data>|01|By Period|02|By Month</data>
</gw:list>
</form>
   
</body>
</html>
