<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var lang="<%=Session("Lang")%>";
var arrHolidayDate    = new Array();
var arrHolidayMonth   = new Array();
var arrHolidayYear    = new Array();
var arrHolidayType    = new Array();
var arrHolidayComment = new Array();
var cGrid;
var v_month;
var v_year;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
    //if (v_language!="ENG")
        System.Translate(document);
   //dtDate.SetEnable(false); 
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        {
            datCompany_info.Call(); 
               
        }
	else
		OnSearch();
   
	
}
//-----------------------------------------------------
function DrawingCalendar()
{   
    ClearDay();
    var iDay = 1;
    var maxDay = GetMaxDayOfMonth(dtMonth.GetData());
    var m = dtMonth.GetData();
    var tmp = m.substr(0,4)+"/"+m.substr(4,2)+"/01";
    var d = new Date(tmp);
    var dayOfWeek = d.getDay();
    var x = document.getElementById("tblCalendar");    
    dayOfWeek = dayOfWeek -1;
    for(var i=1;i<=5;i++)
    {
       for(var j=0;j<=6;j++)
       {
          if((j >= dayOfWeek)&&(i == 1))  // dong dau tien
          {
             if((j==6)||(dayOfWeek == -1))  // ngay Sunday
             {
                j=6;
              	x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>" + iDay + "</b></font>";
			
             }
             else if (j==5)  // ngay thu 7
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=blue><b>" + iDay + "</b></font>";
				
             }              
             else    // ngay binh thuong
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=black><b>" + iDay + "</b></font>" ;
					
             }
             iDay++;
          }
          else if((iDay <= maxDay)&&(i>1))  // cac dong con lai
          {
             if(j==6)   // ngay chu nhat
             {
				
				
					x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>" + iDay + "</b></font>";
					
             }
             else if (j==5)  // ngay thu 7
             {
				
				
					x.rows[i].cells[j].innerHTML = "<font color=blue><b>" + iDay + "</b></font>";
					
             }   
             else   // ngay binh thuong
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=black><b>" + iDay + "</b></font>" ;
					
             }
             iDay++;
          }
                   
          
       }
    }
    j=0;
    while(iDay <= maxDay) 
    {
       
       if(j==6)  // ngay chu nhat
       {
          x.rows[1].cells[j].innerHTML = "<font color=#ff00cc><b>" + iDay +"</b></font>";
       }
       else if (j==5)  // ngay thu 7
       {
		  x.rows[i].cells[j].innerHTML = "<font color=blue><b>" + iDay +"</b></font>";
       }   
       else    // ngay binh thuong
       {
          x.rows[1].cells[j].innerHTML = "<font color=black><b>" + iDay +"</b></font>";
       }
       iDay++;
       j++;
    }
    
}
//------------------------------------------------------
function GetMaxDayOfMonth(vMonth)
{
   var iMonth = Number(vMonth.substr(4,2));
   var iYear = Number(vMonth.substr(0,4));
   if((iMonth == 4)||(iMonth == 6)||(iMonth == 9)||(iMonth == 11))
   {
     return 30;
   }
   else if(iMonth == 2)
   {
      if(IsLeapYear(iYear))
      {
        return 29;
      }
      else
      {
        return 28;
      }
   }
   else
   {
     return 31;
   }

}
//------------------------------------------------------------
function IsLeapYear(vYear)
{
       
   iYear  = Number(vYear);
   if((iYear%4==0)&&(iYear%100!=0)||(iYear%100==0))
   {
     return true;
   }
   else
   {
    return false;
   }
}

//-----------------------------------------------------------------
function ClearDay()
{
    var x = document.getElementById("tblCalendar");
    for(var i=1;i<=5;i++)
    {
        for(var j=0;j<=6;j++)
        {
           //x.rows[i].cells[j].innerHTML = "";
           x.rows[i].cells[j].innerText = "";
        }
    }
}

//------------------------------------------------------
function OnSearch()
{	
	DrawingCalendar();
	datCanlendar.Call("SELECT");
	
}
//---------------------------------------------------------
function OnDataReceive(obj)
{
    if (obj.id=="datCanlendar")
    {
        for(cGrid=1;cGrid<grdCalendar.rows;cGrid++)
        {
           arrHolidayDate[cGrid]  = Number((grdCalendar.GetGridData(cGrid,1)).substr(6,2));
           arrHolidayMonth[cGrid] = Number((grdCalendar.GetGridData(cGrid,1)).substr(4,2));
           arrHolidayYear[cGrid]  = Number((grdCalendar.GetGridData(cGrid,1)).substr(0,4));
           arrHolidayType[cGrid]    = grdCalendar.GetGridData(cGrid,3);
           arrHolidayComment[cGrid] = grdCalendar.GetGridData(cGrid,4);
        }   
       
       for (var i=1;i<cGrid;i++)
       {	
	        SearchDraw(arrHolidayDate[i],arrHolidayMonth[i],arrHolidayYear[i],arrHolidayType[i],arrHolidayComment[i]);
       }   
    datMaxDate.Call();
    
    }
	if (obj.id=="datCompany_info")
       {
			OnSearch();
	   }
        
}
//------------------------------------------------------

function SearchDraw(p_date,p_month,p_year,p_holtype,p_comment)
{   	
	var v_day;
	var x = document.getElementById("tblCalendar"); 
	v_month = Number((dtMonth.value).substr(4,2));
	v_year = Number((dtMonth.value).substr(0,4));

	if ((v_month == p_month) && (v_year == p_year))
		{	
			for(var i=1;i<=5;i++)
				{   
					for(var j=0;j<=6;j++)
						{	
							var s = (x.rows[i].cells[j].innerText).substr(0,5);
							s = Number(s);
							v_day = s;	
							if (v_day == p_date)	
								{
									x.rows[i].cells[j].innerHTML = "<font color=red><b>" + v_day + "<BR><BR>(" + p_comment + " ...)" + "</b></font>";	     
								}	
						}
				}  
		}		
}
//--------------------------------------------------------------
function OnClickEntry()
{	 
	var month=dtMonth.value;
	v_month = Number((dtMonth.value).substr(4,2));
	v_year = Number((dtMonth.value).substr(0,4));
	//alert(v_month + "  " + v_year);
	var url = "/standard/forms/hr/ti/hrti00201.aspx?MONTH=" + v_month + "&YEAR=" + v_year+"&v_company_pk="+lstCompany.value;
	var obj;
	obj = System.OpenModal(System.RootURL + url,800,500,"resizable:yes;status:yes"); 
	if (obj != 0)
	  { 	 
		 OnSearch();
	  }
	
}
function OnCreate()
{datCreateDate.Call();
}
function OnChangeDate()
{if(  Number(dtUntilDate.value) <=Number(dtDate.value))
    {ibtnProcess.SetEnable(false);
    }
   else
    ibtnProcess.SetEnable(true);
}
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
<gw:data id="datCompany_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datCanlendar" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRTI00200_0" > 
                <input bind="grdCalendar">
                    <input bind="dtMonth" /> 
					<input bind="lstCompany" />
                </input> 
                <output bind="grdCalendar"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datMaxDate" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_HRTI00200_1" > 
                <input>
                    <input bind="dtDate" /> 
					<input bind="lstCompany" />
                </input> 
                <output>
                    <output bind="dtDate" />
                     <input bind="dtUntilDate" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datCreateDate" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00200_0" > 
                <input>
                    <input bind="dtDate" />
                    <input bind="dtUntilDate" /> 
					<input bind="lstCompany" />
                </input> 
                <output>
                    <output bind="dtDate" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table--------------------------------->
<table id="expand" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" class="eco_line">
    <tr style="width:100%;height:100%" valign="top">
        <td>
            <div style="height:2%" class="eco_bg">
				<table width="100%"  style="height:100%" border="0" cellpadding="3" cellspacing="2">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=10 width="10%" style="border:0" align="left" >Company</td>
						<td colspan=10 width="10%" style="border:0"> 
							<gw:list  id="lstCompany"  styles='width:100%' onchange="OnSearch()" >
								<data>
									<%= CtlLib.SetListDataSQL("select a.pk,a.PARTNER_NAME from tco_company a  where a.del_if = 0 and nvl(a.active_yn,'N')='Y' order by a.pk ")%>
								</data>
							</gw:list>
						</td>
						<td colspan=10 width="10%" style="border:0" align="center" >
							Max Date
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:datebox id="dtDate" type="date" lang="<%=session("lang")%>" nullaccept onchange=""/>
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							Create Date
						</td>
						<td colspan=5 width="5%" style="border:0" align="right" >
							<gw:datebox id="dtUntilDate" type="date" lang="<%=session("lang")%>" onchange="OnChangeDate()"/>
						</td>
						<td colspan=2 width="2%" style="border:0" align="right" >
							<gw:button img="process" id="ibtnProcess"   alt="Create Date"  onclick="OnCreate()"/>
						</td>
						<td colspan=10 width="10%" style="border:0" align="center" >
							Month 
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:datebox id="dtMonth" type="month" lang="<%=session("lang")%>" onchange="OnSearch()"/>
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="idBtnEntry" img="popup" alt="Popup" onclick="OnClickEntry()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="idBtnSelect" img="search" alt="Search" onclick="OnSearch()" />
						</td>
					</tr>
				</table>
			</div>
			<div style="background:#FBEFF2" class="eco_line_t">
                <table width=100% height="95%" id="tblCalendar" cellpadding=0 cellspacing=0 border="1px solid gray" bgcolor="#f5f8f9" style="border-collapse: collapse">
                    <tr bgcolor="#93cefc">
	                    <th height=30px width=14%><basefont size=4>MON</th>
	                    <th height=30px width=14%><basefont size=4>TUE</th>
	                    <th height=30px width=14%><basefont size=4>WED</th>
	                    <th height=30px width=14%><basefont size=4>THU</th>
	                    <th height=30px width=14%><basefont size=4>FRI</th>
	                    <th height=30px width=14% bgcolor=#99ffff><basefont size=4>SAT</th>
	                    <th bgcolor=#ffc448 height=30px width=14%><basefont size=4>SUN</th>
                    </tr>
                    <tr valign=top>
                        <td height=80px></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr valign=top>
                        <td height=80px></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr valign=top>
                        <td height=80px></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr valign=top>
                        <td height=80px></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                     <tr valign=top>
                        <td height=80px></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                     </tr>
                </table>
			</div>
		</td>
	</tr>
</table>

		


		
<gw:grid   
	id="grdCalendar"  
	header="_PK|Date|Day Type|Holiday Type|Comment|Remark|_DEL_IF|_CRT_BY|_CRT_DT|_MOD_BY|_MOD_DT"   
	format="0|0|0|0|0|0|0|0|0|0|0"  
	aligns="0|0|0|0|0|0|0|0|0|0|0"  
	defaults="||||||||||"  
	editcol="1|1|1|1|1|1|1|1|1|1|1"  
	widths="0|0|0|0|0|0|0|0|0|0|0"  
	styles="width:100%; height:400; display:none"   
	sorting="F"   
	param="0,1,2,3,4,5,6,7,8,9,10"  /> 

<gw:textbox id="iduser_pk" styles="display:none"/>
	<gw:textbox id="txtHr_level" styles="display:none"/>
</body>
</html>

