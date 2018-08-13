<!-- #include file="../../../system/lib/form.inc"  -->
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PRODUCTION PLAN STATUS</title>
</head>

<script>
var lang="<%=Session("Lang")%>";

var G1_Day          = 0,
    G1_PlanQty      = 1,
    G1_GrossQty     = 2,
    G1_SafeQty      = 3,
    G1_FinishQty    = 4;
    
var v_language = "<%=Session("SESSION_LANG")%>";

//-----------------------------------------------------

function BodyInit()
{  
    System.Translate(document);
    BindingDataList();
    //------------------- 
	OnSearch();
}

//------------------------------------------------------

function BindingDataList()
{
    var data=""; 
       
    
}

//------------------------------------------------------

function OnSearch()
{	
	DrawingCalendar();
	data_fpip00070.Call("SELECT");
	
}

function OnPopUp()
{
     var fpath = System.RootURL + "/form/fp/ip/fpip00030.aspx";
     oValue = System.OpenModal( fpath , 900 , 700, 'resizable:yes;status:yes');
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
              	x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay + "</b></font>";
			
             }
             else if (j==5)  // ngay thu 7
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
             if(j==6)   // ngay chu nhat
             {
				
				
					x.rows[i].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay + "</b></font>";
					
             }
             else if (j==5)  // ngay thu 7
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
       
       if(j==6)  // ngay chu nhat
       {
          x.rows[1].cells[j].innerHTML = "<font color=#ff00cc><b>&nbsp;" + iDay +"</b></font>";
       }
       else if (j==5)  // ngay thu 7
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

//---------------------------------------------------------

var arrDay          = new Array();
var arrMonth        = new Array();
var arrYear         = new Array();
var arrPlanQty      = new Array();
var arrMatGrossQty  = new Array();
var arrSafeQty      = new Array();
var arrFinishQty    = new Array();

var cGrid;
var v_month;
var v_year;

function OnDataReceive(obj)
{
    if (obj.id=="data_fpip00070")
    {
        for(cGrid=1;cGrid<grdResult.rows;cGrid++)
        {
           arrDay[cGrid]            = Number((grdResult.GetGridData( cGrid, G1_Day)).substr(6,2));
           arrMonth[cGrid]          = Number((grdResult.GetGridData( cGrid, G1_Day)).substr(4,2));
           arrYear[cGrid]           = Number((grdResult.GetGridData( cGrid, G1_Day)).substr(0,4));
           arrPlanQty[cGrid]        = grdResult.GetGridData( cGrid, G1_PlanQty  );
           arrMatGrossQty[cGrid]    = grdResult.GetGridData( cGrid, G1_GrossQty );
           arrSafeQty[cGrid]        = grdResult.GetGridData( cGrid, G1_SafeQty  );
           arrFinishQty[cGrid]      = grdResult.GetGridData( cGrid, G1_FinishQty);

	       SearchDraw(arrDay[cGrid],arrMonth[cGrid],arrYear[cGrid],arrPlanQty[cGrid],arrMatGrossQty[cGrid],arrSafeQty[cGrid],arrFinishQty[cGrid]);
           
        }   
 
    }
        
}

//------------------------------------------------------

function SearchDraw(p_day,p_month,p_year,p_plan_qty,p_gross_qty,p_safe_qty,p_finish_qty)
{   	
	var v_day;
	var x = document.getElementById("tblCalendar"); 
	
	v_month = Number((dtMonth.value).substr(4,2));
	v_year  = Number((dtMonth.value).substr(0,4));

	if ((v_month == p_month) && (v_year == p_year))
	{	
		for(var i=1;i<=5;i++)
		{   
			for(var j=0;j<=6;j++)
			{	
				var s = (x.rows[i].cells[j].innerText).substr(0,5);
				s     = Number(s);
				v_day = s;	
				
				if (v_day == p_day)	
				{
				    var l_str = "<BR><BR>-Plan Qty &nbsp;&nbsp;:&nbsp;<font color=red>" + p_plan_qty + "</font><BR>-Mat Req &nbsp;&nbsp;:&nbsp;<font color=red>" + p_gross_qty +"</font>";
				        l_str = l_str + "<BR>-Safe Qty &nbsp;&nbsp;:&nbsp;<font color=red>" + p_safe_qty + "</font><BR>-Finish Qty :&nbsp;<font color=red>" + p_finish_qty +"</font>";
					
					x.rows[i].cells[j].innerHTML = x.rows[i].cells[j].innerHTML + l_str ;	     
				}	
			}
		}  
	}		
}

//-----------------------------------------------------

function OnRadChange()
{
	var strRad = radViewType.GetData();
	
	switch (strRad)
	{
		case '1':
				tblCalendar.style.display = "none" ;
        break;			
		case '2':
				tblCalendar.style.display = "" ;
		break;					
	}    
}

//-----------------------------------------------------

</script>

<body>
    <!------------main control---------------------->
    <gw:data id="data_fpip00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  function="<%=l_user%>lg_sel_fpip00070" > 
                <input bind="grdResult">
                    <input bind="lstProcess" />
                    <input bind="dtMonth" /> 
                </input> 
                <output bind="grdResult"/>
            </dso> 
        </xml> 
</gw:data>
    <!--------------------main table--------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 30%">
                            <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                            Month</td>
                        <td style="width: 10%">
                            <gw:datebox id="dtMonth" type="month" lang="<%=session("lang")%>" onchange="OnSearch()" />
                        </td>
                        <td style="width: 26%">
                        </td>
                        <td style="width: 20%" align="center">
                            <gw:radio id="radViewType" value="2" styles="width:100%" onchange="OnRadChange()">                      
			                    <span value="1">List</span>                       
			                    <span value="2">Calendar</span>                   
        			        </gw:radio>
                        </td>                            
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="idBtnEntry" img="Popup" alt="" onclick="OnPopUp()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="idBtnSelect" img="Search" alt="Search" onclick="OnSearch()" />
                        </td>                    
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <table style="width: 100%; height: 100%" id="tblCalendar" cellpadding="0" cellspacing="0"
                    border="1" bordercolor="gray" bgcolor="#f5f8f9" style="border-collapse: collapse">
                    <tr bgcolor="#93cefc" style="height: 5%">
                        <th style="width: 15%">
                            <basefont size="4">MON</th>
                        <th style="width: 15%">
                            <basefont size="4">TUE</th>
                        <th style="width: 14%">
                            <basefont size="4">WED</th>
                        <th style="width: 14%">
                            <basefont size="4">THU</th>
                        <th style="width: 14%">
                            <basefont size="4">FRI</th>
                        <th style="width: 14%" bgcolor="#99ffff">
                            <basefont size="4">SAT</th>
                        <th style="width: 14%" bgcolor="#ffc448">
                            <basefont size="4">SUN</th>
                    </tr>
                    <tr valign="top" style="height: 19%">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr valign="top" style="height: 19%">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr valign="top" style="height: 19%">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr valign="top" style="height: 19%">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr valign="top" style="height: 19%">
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------->
    <gw:grid id="grdResult" header="Date|Plan Qty|Gross Qty|Safe Qty|Finish Qty" format="0|0|0|0|0"
        aligns="0|0|0|0|0" editcol="1|1|1|1|1" widths="0|0|0|0|0" styles="width:100%; height:400; display:none"
        sorting="F" />
    <!----------------------------------------------------------------->
</body>
</html>
