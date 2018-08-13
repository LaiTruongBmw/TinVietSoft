<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var flag=0;
var codeadmin_yn;
codeadmin_yn ="<%=Session("CODEADMIN_YN")%>";
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);
   <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 5 , "Y|YES|N|NO") %>; 
   <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 6 , "Y|YES|N|NO") %>; 
   <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 12 , "Y|YES|N|NO") %>; 
   if(codeadmin_yn!='Y')
        idConfirm.SetEnable(0);
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtUser_PK.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
   var data;
   data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
   lstCompany.SetDataText(data);
  
  if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
    datUser_info.Call(); 
  else
	ChangeLocation();
        
   
}

function OnDataReceive(obj)
{
    if(obj.id=="datUser_info")
		dat_sal_rule_option.Call(); 
    if(obj.id=="dat_sal_rule_option")
    {
        var t=Number(txt_option.text)        
        if(t>0)
            document.form1.option_P[t-1].checked=true	
       
        dat_sal_rule.Call("SELECT");
    }
    if(obj.id=="dat_sal_rule")
    {
        if(flag==1)
            dat_confirm.Call();
        
    }
    if(obj.id=="dat_confirm")
    {
        if(flag==1)
        {
            flag=0;
            if(txt_result.text=='0')
                alert("Confirm successful.\nXác nhận thành công.")
            else    
                alert("Confirm unsuccessful.\nXác nhận không thành công.")
                
        }
        
    }
}
function onConfim()
{ 
    var len , opt, flag_tmp
	len = document.form1.option_P.length;
	opt = document.form1.option_P;
			
	flag_tmp=0;
	for(i = 0; i< len; i++)
	{		
		if (opt[i].checked)
		{		
		    flag_tmp=1;
		    txt_option.text=opt[i].value;	
		   
		}
	}	
	if(flag_tmp==0)
	{
	    alert("Choose salary rule please.\nBạn chưa chọn salary option.")
	    return;
	}
    if(confirm("Are you sure to confirm?\nBạn đã chắc chắn?"))
    {   
        flag=1;
		
		dat_sal_rule.Call();
		
    }    
}

function ChangeLocation()
{
 var len , opt, flag_tmp
	len = document.form1.option_P.length;
	opt = document.form1.option_P;
	
	
	
	flag_tmp=0;
	for(i = 0; i< len; i++)
	{	    flag_tmp=1;
		    txt_option.text='';	
		    opt[i].checked=false;
	
	}	
	dat_sal_rule_option.Call(); 
}

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
<gw:data id="dat_sal_rule_option" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01200_0" > 
                <input>
                    <input bind="txt_option" />
                    <input bind="lstCompany" />
                </input> 
                <output>
                    <output bind="txt_option" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_confirm" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM01200_1" > 
                <input>
                    <input bind="txt_option" />
                    <input bind="lstCompany" />
                </input> 
                <output>
                    <output bind="txt_result" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="txtUser_PK" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="dat_sal_rule" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,1,5,6,7,8,9,10,11,12,13" function="ST_HR_SEL_HRPM01200_0" procedure="ST_HR_UPD_HRPM01200_0" > 
                <input bind="idGrid" >
                    <input bind="txt_option" />
                    <input bind="lstCompany" />
                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>


<!--------------------main table--------------------------------->
<form name="General Reports" id="form1">
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="0" class="eco_line">
	<tr>
	    <td>
			<div style="width:100%;height:30%" class="eco_bg">
				<table style="width:100%;height:100%" cellpadding="2" cellspacing="1" valign="top" border="0" >	
					<tr style="height:6%;border:0">	
						<td align=right colspan=25 style="width:4%"><font size=4 class="eco_link">Company</font></td>
						<td align=left colspan=25>
						    <gw:list  id="lstCompany" value="" maxlen = "100" styles='width:30%' onchange="ChangeLocation()" />
						</td>
						
					</tr>	
					<tr style="height:6%;border:0">	
						<td align=left colspan=2 style="width:4%"></td>
						<td align=left colspan=9 style="width:18%"><input type="radio" name="option_P" value="1" onclick=""><b><font color=black size=3>Day Salary</font></b></td>
						<td align=right style="width:2%"><b><font color=Black size=3>=</font></b></td>
						<td align=right colspan=4 style="width:8%"><b><font color=red size=3>Salary</font></b></td>
						<td align=left colspan=8 style="width:16%"><b><font color=Black size=3>/26</font></b></td>
						<td align=center style="width:2%"><b><font color=Black size=3>*</font></b></td>
						<td align=left colspan=25 style="width:50%"><b><font color=Black size=3>Working Days</font></b></td>
					</tr>	
					<tr style="height:6%;border:0">	
						<td align=left colspan=2 style="width:4%"></td>
						<td align=left colspan=9 style="width:18%"><input type="radio" name="option_P" value="2" onclick=""><b><font color=black size=3>Month Salary</font></b></td>
						<td align=right style="width:2%"><b><font color=Black size=3>=</font></b></td>
						<td align=right colspan=4 style="width:8%"><b><font color=red size=3>Salary</font></b></td>
						<td align=left colspan=8 style="width:16%"><b><font color=Black size=3>/Days In Month</font></b></td>
						<td align=center style="width:2%"><b><font color=Black size=3>*</font></b></td>
						<td align=left colspan=25 style="width:50%"><b><font color=Black size=3>Working Days</font></b></td>
						
					</tr>	
					<tr style="height:6%;border:0">	
						<td align=left colspan=2 style="width:4%"></td>
						<td align=left colspan=9 style="width:18%"><input type="radio" name="option_P" value="3" onclick=""><b><font color=black size=3>Month Salary 2</font></b></td>
						<td align=right style="width:2%"><b><font color=Black size=3>=</font></b></td>
						<td align=right colspan=4 style="width:8%"><b><font color=red size=3>Salary</font></b></td>
						<td align=left colspan=8 style="width:16%"><b><font color=Black size=3>/26</font></b></td>
						<td align=center style="width:2%"><b><font color=Black size=3>*</font></b></td>
						<td align=left colspan=7 style="width:14%"><b><font color=Black size=3>Working Days</font></b></td>
						<td align=left colspan=19 style="width:38%"><b><font color=Black size=3>(IF Working Days<=13)</font></b></td>
					</tr>	
					<tr style="height:6%;border:0">	
						<td align=left colspan=2 style="width:4%"></td>
						<td align=left colspan=9 style="width:18%"></td>
						<td align=right style="width:2%"><b><font color=Black size=3>=</font></b></td>
						<td align=right colspan=4 style="width:8%"><b><font color=red size=3>Salary</font></b></td>
						<td align=right colspan=7 style="width:14%"><b><font color=Black size=3>-Salary/26</font></b></td>
						<td align=center style="width:2%"><b><font color=Black size=3>*</font></b></td>
						<td align=left colspan=15 style="width:30%"><b><font color=Black size=3>(Days_In_Month-Working Days)</font></b></td>
						<td align=left colspan=12 style="width:24%"><b><font color=Black size=3>(IF Working Days>13)</font></b></td>
					</tr>	
					<tr style="height:6%;border:0">	
						<td align=left colspan=25 style="width:50%"></td>
						<td align=right style="width:5%;border:0"><gw:button id="idConfirm"  styles='width:90%' img="confirm"  text="Confirm"  onclick="onConfim()"/></td>
					</tr>	
				</table>
			</div>
			<div style="width:100%;height:70%" class="eco_line_t">
				<table id="tblMain" style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td align=center id="tdMaster"">
							<gw:grid   
							id="idGrid"  
							header="Select|Code|Name|FName|KName|CALCULATE WITH WT|CALCULATE WITH OT|_PK|_MASTER_PK|ALLOWANCE PROBATION RATE|_p_location|NO CAL WITH NET|CAL WITH INSURANCE|REMARK"   
							format="3|0|0|0|0|0|0|0|0|0|0|0|0|0"  
							aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
							defaults="||||||||||0|||"  
							editcol="1|0|0|0|0|1|1|0|0|1|0|1|1|1"  
							widths="1000|1300|2000|2000|2000|2000|2000|2000|2000|2000|0|2000|2000|2500"  
							styles="width:100%; height:98%"   
							sorting="T"   
							oncellclick     = "" />
						</td>
					</tr>
				</table>
			</div>
	    </td>
	</tr>
</table>
</form>
<gw:textbox id="txt_option" styles="display:none"/>
<gw:textbox id="txt_result" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtUser_PK" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
    
</body>
</html>

