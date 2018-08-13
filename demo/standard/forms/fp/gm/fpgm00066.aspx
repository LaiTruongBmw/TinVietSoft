<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser("hr")%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
var arrDate = new Array();
var arrPlanQty = new Array();
var arrProdQty = new Array();
var arrProdRate = new Array();
var arrRemainQty = new Array();
var cGrid;
var v_month;
var v_year;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    if (v_language!="ENG")
        System.Translate(document);  
        
        
    var data = "<%=ESysLib.SetListDataSQL("SELECT  a.pk, GROUP_ID||'-'||group_name FROM prod.pb_line_group a where del_if=0")%>";   
    lstLineGroup.SetDataText(data); 
    
	OnSearch();
	//Dsql_Holiday_Plan_Receive();
}
//-----------------------------------------------------
function DrawingCalendar()
{   
    ClearDay();
    var iDay = 1;
    var maxDay = GetMaxDayOfMonth(dtMonth1.GetData());
    var m = dtMonth1.GetData();
    var tmp = m.substr(0,4)+"/"+m.substr(4,2)+"/01";
    var d = new Date(tmp);
    var dayOfWeek = d.getDay();
    var x = document.getElementById("tblCalendar");    
    //dayOfWeek = dayOfWeek -1;
    for(var i=1;i<=6;i++)
    {
       for(var j=0;j<=6;j++)
       {
          if((j >= dayOfWeek)&&(i == 1))  // dong dau tien
          {
             if((j==0))  // ngay Sunday
             {
                //j=0;
              	x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay + "</b></font>";
			
             }
             else if (j==6)  // ngay thu 7
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=blue><b>&nbsp;" + iDay + "</b></font>";
				
             }              
             else    // ngay binh thuong
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=black><b>&nbsp;" + iDay + "</b></font>" ;
					
             }
             iDay++;
          }
          else if((iDay <= maxDay)&&(i>1))  // cac dong con lai
          {
             if(j==0)   // ngay chu nhat
             {
					x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay + "</b></font>";
					
             }
             else if (j==6)  // ngay thu 7
             {
				
				
					x.rows[i].cells[j].innerHTML = "<font color=blue><b>&nbsp;" + iDay + "</b></font>";
					
             }   
             else   // ngay binh thuong
             {
				
					x.rows[i].cells[j].innerHTML = "<font color=black><b>&nbsp;" + iDay + "</b></font>" ;
					
             }
             iDay++;
          }
                   
          
       }
    }
    j=0;
    while(iDay <= maxDay) 
    {
       
       if(j==0)  // ngay chu nhat
       {
          x.rows[1].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay +"</b></font>";
       }
       else if (j==6)  // ngay thu 7
       {
		  x.rows[i].cells[j].innerHTML = "<font color=blue><b>&nbsp;" + iDay +"</b></font>";
       }   
       else    // ngay binh thuong
       {
          x.rows[1].cells[j].innerHTML = "<font color=black><b>&nbsp;" + iDay +"</b></font>";
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
    for(var i=1;i<=6;i++)
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
           arrHolidayDate[cGrid]  = Number((grdCalendar.GetGridData(cGrid,0)).substr(6,2));
           arrHolidayMonth[cGrid] = Number((grdCalendar.GetGridData(cGrid,0)).substr(4,2));
           arrHolidayYear[cGrid]  = Number((grdCalendar.GetGridData(cGrid,0)).substr(0,4));
           
           arrDate[cGrid]    = grdCalendar.GetGridData(cGrid,1);
           arrPlanQty[cGrid] = grdCalendar.GetGridData(cGrid,2);
           arrProdQty[cGrid] = grdCalendar.GetGridData(cGrid,3);
           arrProdRate[cGrid] = grdCalendar.GetGridData(cGrid,4);
           arrRemainQty[cGrid] = grdCalendar.GetGridData(cGrid,5);
           
        }   
       
       for (var i=1;i<cGrid;i++)
       {	
	        SearchDraw(arrHolidayDate[i],arrHolidayMonth[i],arrHolidayYear[i],arrDate[i],arrPlanQty[i],arrProdQty[i],arrProdRate[i],arrRemainQty[i]);
       }      
    }
        
}
//------------------------------------------------------

function SearchDraw(p_date,p_month,p_year,p_prod_date,p_plan_qty,p_prod_qty,p_prod_rate,p_remain_qty)
{   	
	var v_day;
	var x = document.getElementById("tblCalendar"); 
	v_month = Number((dtMonth1.value).substr(4,2));
	v_year = Number((dtMonth1.value).substr(0,4));

	if ((v_month == p_month) && (v_year == p_year))
		{	
			for(var i=1;i<=6;i++)
				{   
					for(var j=0;j<=6;j++)
						{	
							var s = (x.rows[i].cells[j].innerText).substr(0,5);
							s = Number(s);
							v_day = s;	
							if (v_day == p_date)	
								{
									//x.rows[i].cells[j].innerHTML = "<font color=red><b>&nbsp;" + v_day + "<BR><BR>&nbsp;&nbsp;(" + p_comment + " ...)" + "</b></font>";	     
									x.rows[i].cells[j].innerHTML = "<b>&nbsp;<font color=red>"+ v_day +"</font><BR>&nbsp;Plan Qty &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- " + p_plan_qty + "<BR>&nbsp;Prod Qty &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- " + p_prod_qty + "<BR>&nbsp;Prod Rate &nbsp;&nbsp;&nbsp;- " + p_prod_rate + "<BR>&nbsp;Remain Qty - " + p_remain_qty + "</b>";	     
								}	
						}
				}  
		}		
}
//--------------------------------------------------------------
function OnPopUp(pos)
{
    var x = document.getElementById(pos); 
    var s = Trim(x.innerText.substr(0,3));
    if(s!="")
    {
        if(s=="1")
        {
            s="01";
        }
        if(s=="2")
        {
            s="02";
        }
        if(s=="3")
        {
            s="03";
        }
        if(s=="4")
        {
            s="04";
        }
        if(s=="5")
        {
            s="05";
        }
        if(s=="6")
        {
            s="06";
        }
        if(s=="7")
        {
            s="07";
        }
        if(s=="8")
        {
            s="08";
        }
        if(s=="9")
        {
            s="09";
        }
        var dt = dtMonth1.value+s;
        var fpath = System.RootURL + "/form/fp/gm/fpgm00067.aspx?line_pk="+lstLineGroup.value+'&date='+dt; 
        //System.OpenModal( fpath , 600 ,  400, 'resizable:yes;status:yes;fullscreen:yes;titlebar:yes;location:yes');
		var object = window.showModalDialog( fpath , this , 'resizable:yes;toolbar=no;dialogWidth:40;dialogHeight:20');		 
                               
    }  
     
}
//------------------------------------------------------------

//--------------------------------------------------------------

//-------------------------------------------------------------
</script>

<body>
    <!------------main control---------------------->
    <gw:data id="datCanlendar" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  function="prod.sp_sel_fpgm00066" > 
                <input bind="grdCalendar">
                    <input bind="lstLineGroup" /> 
                    <input bind="dtMonth1" /> 
                    
                </input> 
                <output bind="grdCalendar"/>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------main table--------------------------------->
    <table width="100%" border="0">
        <tr>
            <td width="10%" align="right">
                Line Group
            </td>
            <td width="40%" align="right">
                <gw:list id="lstLineGroup" styles="width:100%;" onchange="OnSearch()" />
            </td>
            <td width="10%" align="right">
                <font color="black">Month</font></td>
            <td width="10%">
                <gw:datebox id="dtMonth1" type="month" lang="<%=session("lang")%>" onchange="OnSearch()" />
            </td>
            <td width="20%" align="right">
            </td>
            <td width="10%" align="left">
            </td>
            <td width="10%">
            </td>
            <td width="2%">
            </td>
            <td width="2%" align="right">
                <gw:imgbtn id="idBtnSelect" img="Search" alt="Search" onclick="OnSearch()" />
            </td>
            <td width="10%">
            </td>
        </tr>
    </table>
    <table width="100%" id="tblCalendar" cellpadding="0" cellspacing="0" border="1" bordercolor="gray"
        bgcolor="#f5f8f9" style="border-collapse: collapse">
        <tr bgcolor="#93cefc">
            <th bgcolor="#ffc448" height="30px" width="14%">
                <basefont size="4">SUN</th>
            <th height="30px" width="14%">
                <basefont size="4">MON</th>
            <th height="30px" width="14%">
                <basefont size="4">TUE</th>
            <th height="30px" width="14%">
                <basefont size="4">WED</th>
            <th height="30px" width="14%">
                <basefont size="4">THU</th>
            <th height="30px" width="14%">
                <basefont size="4">FRI</th>
            <th height="30px" width="14%" bgcolor="#99ffff">
                <basefont size="4">SAT</th>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a1')" id="a1">
            </td>
            <td onclick="OnPopUp('a2')" id="a2">
            </td>
            <td onclick="OnPopUp('a3')" id="a3">
            </td>
            <td onclick="OnPopUp('a4')" id="a4">
            </td>
            <td onclick="OnPopUp('a5')" id="a5">
            </td>
            <td onclick="OnPopUp('a6')" id="a6">
            </td>
            <td onclick="OnPopUp('a7')" id="a7">
            </td>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a8')" id ="a8">
            </td>
            <td onclick="OnPopUp('a9')" id="a9">
            </td>
            <td onclick="OnPopUp('a10')" id="a10">
            </td>
            <td onclick="OnPopUp('a11')" id="a11">
            </td>
            <td onclick="OnPopUp('a12')" id="a12">
            </td>
            <td onclick="OnPopUp('a13')" id="a13">
            </td>
            <td onclick="OnPopUp('a14')" id="a14">
            </td>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a15')" id ="a15">
            </td>
            <td onclick="OnPopUp('a16')" id="a16">
            </td>
            <td onclick="OnPopUp('a17')" id="a17">
            </td>
            <td onclick="OnPopUp('a18')" id="a18">
            </td>
            <td onclick="OnPopUp('a19')" id="a19">
            </td>
            <td onclick="OnPopUp('a20')" id="a20">
            </td>
            <td onclick="OnPopUp('a21')" id="a21">
            </td>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a22')" id ="a22">
            </td>
            <td onclick="OnPopUp('a23')" id="a23">
            </td>
            <td onclick="OnPopUp('a24')" id="a24">
            </td>
            <td onclick="OnPopUp('a25')" id="a25">
            </td>
            <td onclick="OnPopUp('a26')" id="a26">
            </td>
            <td onclick="OnPopUp('a27')" id="a27">
            </td>
            <td onclick="OnPopUp('a28')" id="a28">
            </td>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a29')" id ="a29">
            </td>
            <td onclick="OnPopUp('a30')" id="a30">
            </td>
            <td onclick="OnPopUp('a31')" id="a31">
            </td>
            <td onclick="OnPopUp('a32')" id="a32">
            </td>
            <td onclick="OnPopUp('a33')" id="a33">
            </td>
            <td onclick="OnPopUp('a34')" id="a34">
            </td>
            <td onclick="OnPopUp('a35')" id="a35">
            </td>
        </tr>
        <tr valign="top">
            <td height="80px" onclick="OnPopUp('a36')" id ="a36">
            </td>
            <td onclick="OnPopUp('a37')" id="a37">
            </td>
            <td onclick="OnPopUp('a38')" id="a38">
            </td>
            <td onclick="OnPopUp('a39')" id="a39">
            </td>
            <td onclick="OnPopUp('a40')" id="a40">
            </td>
            <td onclick="OnPopUp('a41')" id="a41">
            </td>
            <td onclick="OnPopUp('a42')" id="a42">
            </td>
        </tr>
    </table>
    <gw:grid id='grdCalendar' header='PLAN_DATE|P_DATE|PLAN_QTY|PROD_QTY|PROD_RATE|REMAIN_QTY'
        format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' check='|||||' editcol='1|1|1|1|1|1'
        widths='1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:460;display:none' />
</body>
</html>
