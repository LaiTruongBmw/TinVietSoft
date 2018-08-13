<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Processing</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<script> 
    
//=======================================================================
var callerWindowObj = dialogArguments;  
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    System.Translate(document); 
	
    //-------------------------
	txtEmployee.text = "<%=request.QueryString("emp_id")%>";
	dtMonth_close.value = "<%=request.QueryString("month")%>";
    //-------------------------
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	ChangeColorItem(lstOrg.GetControl());
	lstOrg.value = "<%=request.QueryString("org_pk")%>" ;
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstSalaryPeriod.SetDataText(data);
	
	OnChangeMonth();
} 
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
//=======================================================================
function OnProcess(obj)
{
	lblStatus.text = "";
	if(obj == "NEW")
	{
		if(confirm((v_language =="ENG")?"Do you want to process data?":"Bạn muốn xử lý dữ liệu?"))
		{
			txtFlag.text = obj;
			pro_hrpm00201_0.Call();
		}
	}
	else if (obj == "DEL")
	{
		if(confirm((v_language =="ENG")?"Do you want to delete data?":"Bạn muốn xóa dữ liệu?"))
		{
			txtFlag.text = obj;
			pro_hrpm00201_0.Call();
		}
	}
	   
}

function OnChangeDate()
{
	if(dtFrom.value != dtTo.value )
	{
		dtTo.value = dtFrom.value;
	}
}
function OnDataReceive(obj)
{
    if(obj.id=="pro_hrpm00201_0")
    {
		if(txtFlag.text == "NEW")
		{
			if(txtResult.text == "1")
			{
				lblStatus.text = (v_language =="ENG")?"Process success":"Xử lý thành công";
			}
			else 
			{
				lblStatus.text = (v_language =="ENG")?"Process fail":"Xử lý có lỗi";
			}
		}
		else
		{
			if(txtResult.text == "1")
			{
				lblStatus.text = (v_language =="ENG")?"Delete success":"Xử lý thành công";
			}
			else 
			{
				lblStatus.text = (v_language =="ENG")?"Delete fail":"Xử lý có lỗi";
			}
		}
        
    }
	else if (obj.id=="datCheck_Month")
    {
       
        if(lblstatus2.text=="Closed")
        {
            idBtnProcess.SetEnable(0);
            idBtnDelete.SetEnable(0);
        }    
        else
        {
            idBtnProcess.SetEnable(1);
            idBtnDelete.SetEnable(1);
        }
        check_init=1;
		
    }
}
function OnChangeMonth()
{
    datCheck_Month.Call();
    
}
//=======================================================================
</script>

<body>
<gw:data id="pro_hrpm00201_0" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00201_0" > 
                <input >
                    <input bind="txtFlag" /> 
                    <input bind="dtMonth_close" />
                    <input bind="lstOrg" />  
                    <input bind="lstSalaryPeriod" />
                    <input bind="txtEmployee" />
                </input>
                <output >
                    <output bind="txtresult" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------------>
<gw:data id="datCheck_Month" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00200_1" > 
                <input >
					<input bind="txtLang" /> 
                    <input bind="dtMonth_close" /> 
                    <input bind="lstOrg" /> 
                    <input bind="lstSalaryPeriod" /> 
                </input>
                <output >
                    <output bind="lbldata2" /> 
                    <output bind="lblstatus2" /> 
                    <output bind="txtMonth_flag" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>
    <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="center"  align="top" >
		<tr>
			<td align="center"  >
				<table style="width:80%;height:50%;" cellpadding="2" cellspacing="1" valign="center" align="center" border="0" >
					<tr style="height: 5%">
						<td colspan=4 style="font-size: large; color: Blue;width:100%" align="center">
							&nbsp;
						</td>
					</tr>
					<tr style="height: 5%">
						<td colspan=4 style="font-size:16; color: Blue;width:100%" align="center">
							Create Monthly Salary
						</td>
					</tr>
					<tr style="height: 3%">
						<td colspan=4 style="font-size: large; color: Blue;width:100%" align="center">
							&nbsp;
						</td>
					</tr>
					<tr style="height: 85%">
						<td colspan=4 >
							<table style="width:100%;height:100%;">
								<tr style="height: 5%">
									<td   align="right" width="30%" >Work Month</td>
									<td  align="left" class="" width="20%">
										<gw:datebox id="dtMonth_close"  onchange="OnChangeMonth()" tyles="width:100%" type="month" lang="<%=Session("Lang")%>" />
									</td>
									<td  align="right" width="10%" >Status : </td>
									<td  align="left" class="" width="40%">
										<gw:label id="lbldata2"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" />
									</td>
								</tr>	
								<tr style="height: 5%">
									<td   align="right" width="30%" >Salary Period</td>
									<td  colspan=3 align="left" class="" width="70%">
										<gw:list  id="lstSalaryPeriod" value='01' maxlen = "100" styles='width:100%' onchange="OnChangeMonth()" />
									</td>
								</tr>	
								<tr style="height: 5%">
									<td   align="right" width="30%" >Organization</td>
									<td  colspan=3 align="left" class="" width="70%">
										<gw:list  id="lstOrg" value='ALL' onchange="OnChangeLocation()"   styles='width:100%' />
									</td>
								</tr>
								<tr style="height: 5%">
									<td   align="right" width="30%" >Employee</td>
									<td  colspan=3 align="left" class="" width="70%">
										<gw:textbox id="txtEmployee"  styles='width:100%'/>
									</td>
								</tr>
							</table>
						</td>
					<tr>
					<tr style="height: 3%">
						<td colspan=4 >
							&nbsp;
						</td>
					</tr>
					<tr style="height:3%" >
						<td align="right" width="25%" > &nbsp; </td>
						<td align="center" width="25%">
							<gw:button id="idBtnProcess" img="process" text="Process" onclick="OnProcess('NEW')" />
						</td>
						<td   align="center" width="25%" >  
							<gw:button id="idBtnDelete" img="delete" text="Delete" onclick="OnProcess('DEL')" />
						</td>
						<td align="left"  width="25%">
							<gw:label id="lblStatus" text="" styles="width:100%;color:red" ></gw:label>
						</td>
					</tr>
				</table>
			</td>
		</tr>       
    </table>
	<gw:textbox id="txtResult" styles="display:none"/>
	<gw:textbox id="txtFlag" styles="display:none" />
	<gw:textbox id="txtLang" text="" styles="display:none"  />
	<gw:textbox id="txtMonth_flag" styles="display:none"/>
	<gw:label id="lblstatus2"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12;display:none" />
	<gw:list  id="lstCompany" value="" maxlen = "100" styles='width:100%;display:none' onchange="ChangeOrganization(1)" >
		<data>
			<%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and (a.pk=nvl('" + Session("COMPANY_PK") + "',a.pk) or '" + Session("HR_LEVEL") + "'='6') and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
		</data>
	</gw:list>
</body>
<!---------------------------------------------------------------------->
</html>
