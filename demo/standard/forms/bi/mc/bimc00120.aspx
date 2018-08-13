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
var flag_daily=1;
var check_init=0;


var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    

    if (v_language!="ENG")
        System.Translate(document);

    txtUser_PK.text = "<%=Session("USER_PK")%>";
    txtChargerPK.text = "<%=Session("EMPLOYEE_PK")%>" ;
    
	idBtnProcess.SetEnable(0);

	 dso_wh_list.Call();
    
	
	
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
				idInterval.text="Not Complete!"
			}	
			else if(result=="1")
			{
				idInterval.text=""
				alert("Load data complete ! ")
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
	var dt,len,opt;
	len = document.form1.option_P.length;
	opt = document.form1.option_P;
    if(check_init==0) //chua khoi tao xong
        return;

	
	for(i = 0; i< len; i++)
	{
		
		if (opt[i].checked)
		{			
			if(process_flag==1)
			{
			    alert("Other task is processing.\nTiến trình khác đang thực hiện");
			    return;
			}
			switch (opt[i].value)
			{
				
				case '1': //Load Ending
				    process_flag=1;
					if(!confirm("Do you want to load ending stock...\n Bạn muốn loading stock? "))
					{
					    process_flag=0;
					    return;
					}    

                    if(flag_daily==1)
                        txdt_tmp.text=idWorkDT.value;
                    else
                        txdt_tmp.text=idWorkFrom.value;

					set_Interval(100);
					idStaus1.text="Load stock is processing...";
                    idStaus2.text="Date: " + txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4);
					pro_bimc00050.Call();
					idBtnProcess.SetEnable(0);
					break;	
				case '2': //Release
					process_flag=1;
					if(!confirm("Do you want to release ending stock...\n Bạn muốn release stock? "))
					{
					    process_flag=0;
					    return;
					}    

                    if(flag_daily==1)
                        txdt_tmp.text=idWorkDT.value;
                    else
                        txdt_tmp.text=idWorkTo.value; //release ngay cuoi den ngay dau tien

					set_Interval(100);
					idStaus1.text="Release stock is processing...";
                    idStaus2.text="Date: " + txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4);
					pro_bimc00050_2.Call();
					idBtnProcess.SetEnable(0);
					break;	
			   
			}
		}
	}				
}


function OnDataReceive(obj)
{
    switch(obj.id)
    {
        
				
		case 'dso_wh_list':
            lstWarehouse.SetDataText(txtWHStr.text);
            check_init=1;
            process_flag=0;
         break;	

         case 'pro_bimc00050':
                    if(flag_daily==2 && txdt_tmp.text!=idWorkTo.value) //month
                    {
                        idStaus1.text=txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4)+ " Process Finish...";

                        txdt_tmp.text=next_day(txdt_tmp.text); //yyyymmdd
                        clear_Interval(idInterval);
    				
                        idStaus2.text="Date:" + txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4);
                         set_Interval(100);
                         idStaus1.text=" Processing ...";
                        pro_bimc00050.Call();
                    }
                    else
                    {

			            txtResult.text=="";
			             clear_Interval(idInterval);
                         idStaus1.text="All Finish...";
			            alert("Sucessful... ");
                        idBtnProcess.SetEnable(1)
		                process_flag=0;
				   
                    }
		        
		    break;    

    case 'pro_bimc00050_2':
            if(flag_daily==2 && txdt_tmp.text!=idWorkFrom.value) //month
            {
                idStaus1.text=txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4)+ " Process Finish...";

                txdt_tmp.text=last_day(txdt_tmp.text); //yyyymmdd
                clear_Interval(idInterval);
    				
                idStaus2.text="Date:" + txdt_tmp.text.substr(6,2)+"/"+txdt_tmp.text.substr(4,2)+"/"+txdt_tmp.text.substr(0,4);
                    set_Interval(100);
                idStaus1.text=" Processing ...";
                pro_bimc00050_2.Call();
            }
            else
            {

			    txtResult.text=="";
			        clear_Interval(idInterval);
                    idStaus1.text="All Finish...";
			    alert("Sucessful... ");
                idBtnProcess.SetEnable(1)
		        process_flag=0;
				   
            }
		        
		    break;    

		
   }            
}

function OnShowPopup()
{
    var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx" ;
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


function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}

function onClickOptionQ(n)
{
    flag_daily=n;
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

function last_day(dt) //yyyymmdd
{
    var ng,th,nam,tmp;
    nam=dt.substr(0,4);
    th=dt.substr(4,2);
    ng=dt.substr(6,2);

    tmp=add_zero(Number(ng)-1);

    if(tmp==0) //ngay 0
    {
     
        th=add_zero(Number(th)-1); //thang -1

        if(th==0)
        {
            th="12";
            nam= Number(nam)-1;
        }

        ng=daysInMonth(th,nam) //ngay cuoi trong thang
        
    }
    else
        ng=tmp;
    return nam+""+th+""+ng;

}

function OnchangeDT(n)
{

    if(n==1)
        form1.option_Q[0].checked=true;
    else
        form1.option_Q[1].checked=true;
    flag_daily=n;
}

function OnDataError(oData)
{
    alert(eval(oData).errmsg);
                    clear_Interval(idInterval);
                    idStaus1.text="Not Finish...";
                    process_flag=0;
	
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
<body>

 <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bimc00050_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="pro_bimc00050" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bimc00050" > 
                <input>
                     <input bind="lstWarehouse" />
                     <input bind="txdt_tmp" />
					 <input bind="txtChargerPK" />												 
                </input> 
                <output> 
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bimc00050_2" onreceive="OnDataReceive(this)" onerror="OnDataError(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bimc000120_2" > 
                <input>
                     <input bind="lstWarehouse" />
                     <input bind="txdt_tmp" />
					 <input bind="txtChargerPK" />												 
                </input> 
                <output> 
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
    </gw:data>  


<form name="W/H Closing" id="form1">
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center" border="0" >
<tr>
	<td width="100%">
		<table class="itable"  style="width:60%;height:6%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >
				<tr style="width:40%;height:4%">
                   <td class="topleft" width="30%" align=right>Ware House</td>		
				    <td class="top" width="40%"><gw:list id="lstWarehouse" styles="width:100%;" /></td>
					
					<td class="topright" width="30%" colspan="2"style="color=#FF00CC" align="left">&nbsp;</td>
				</tr>	
		</table>
		<table  style="width:60%;height:6%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >	
			<tr >
                <td class="topleft" width="10%" align="left"><input type="radio" name="option_Q" value="1" onclick="onClickOptionQ(1)" style="color=Black"><font size=2>Date</font></td>
				<td class="top" width="10%"><gw:datebox id="idWorkDT" lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnchangeDT(1)"></gw:datebox></td>	
                <td class="top" width="20%" align=right >&nbsp;</td>
                <td class="top" width="10%" align="right"><input type="radio" name="option_Q" value="2" onclick="onClickOptionQ(2)" style="color=Black"><font size=2>Period</font></td>
                <td class="top" width="10%"><gw:datebox id="idWorkFrom" lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnchangeDT(2)"></gw:datebox></td>	
                <td class="top" width="5%" align=right >~</td>
                <td class="top" width="10%"><gw:datebox id="idWorkTo" lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnchangeDT(2)"></gw:datebox></td>	
                		
				<td class="topright" width="25%">
                   &nbsp;
                </td>
			</tr>
		</table>
		<table style="width:60%;height:30%" cellpadding="0" cellspacing="0" valign="center" align="center" border="0" >	
            
			<tr  >
				<td class="topleft" width="10%" align="left">&nbsp;</td>
				<td class="top" width="40%" align="left"><input type="radio" name="option_P" value="1" onclick="onClickOption(1)" style="color=Black"><font size=2>Load Ending Stock</font></td>
				<td class="top" width="10%">&nbsp;</td>
                <td class="top" width="10%" align="left">&nbsp;</td>
                <td class="topright" width="30%" align="left">&nbsp;</td>
			</tr>
            
            
			<tr >
				<td class="left" width="10%" align="left">&nbsp;</td>
				<td   align="left" style="color=Black"><input type="radio" name="option_P" value="2"  onclick="onClickOption(1)"><font size=2>Release Stock</font></td>
				<td colspan=3 class="right" width="40%">&nbsp;</td>
			</tr>	
			
			<tr >
				<td class="left" width="10%" align="left" valign=bottom>&nbsp;</td>			
				<td  align="center" style="width:10%"><gw:button id="idBtnProcess" img="process" text="Process" onclick="on_Process()" /></td>
				<td  align="left"  style="width:20%" align="right"><gw:label id="idStaus2" text="" styles="width:100%;color:blue" ></gw:label></td>
                <td   style="width:30%" align="left"><gw:label id="idStaus1" text="" styles="width:100%;color:blue" ></gw:label></td>
				<td class="right"  style="width:30%" align="right"style="color=#FF3300"><gw:label id="idInterval" text="..." styles="width:100%" ></gw:label></td>
			</tr>
	        <tr >
				<td class="bottomleft" width="10%" align="left" valign=bottom>&nbsp;</td>			
				<td class="bottom" align="center" style="width:10%">&nbsp;</td>
				<td class="bottom" align="left"  style="width:20%" align="right">&nbsp;</td>
                <td class="bottom"  style="width:30%" align="left">&nbsp;</td>
				<td class="bottomright"  style="width:30%" align="right"style="color=#FF3300">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>


<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />  
<gw:textbox id="txtChargerPK" styles="width: 100%;display: none" /> 
<gw:textbox id="txtResult" styles="width: 100%;display: none" /> 
<gw:textbox id="txdt_tmp" styles="display:none"/>
 
                     

</html>