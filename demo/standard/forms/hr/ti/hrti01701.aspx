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
	dtMonth.value = "<%=request.QueryString("dtMonth")%>";
	txtEmployee.text = "<%=request.QueryString("emp_id")%>";
    //-------------------------
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	ChangeColorItem(lstOrg.GetControl());
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstSalaryPeriod.SetDataText(data);
	
	pro_HRTI01701_3.Call();
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
function OnProcess()
{
	lblStatus.text ="";
	if(confirm((v_language =="ENG")?"Do you want to process data?":"Bạn muốn xử lý dữ liệu?"))
	{
		pro_HRTI01701_0.Call();
	}
      
}
function OnDelete()
{
	lblStatus.text ="";
	if(confirm((v_language =="ENG")?"Do you want to delete data?":"Bạn muốn xóa dữ liệu?"))
	{
		pro_HRTI01701_1.Call();
	}
      
}

function OnDataReceive(obj)
{
    if(obj.id=="pro_HRTI01701_0")
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
	if(obj.id=="pro_HRTI01701_1")
    {
        if(txtResult.text == "1")
		{
			lblStatus.text = (v_language =="ENG")?"Delete Success":"Xóa thành công";
		}
		else
		{
			lblStatus.text = (v_language =="ENG")?"Delete fail":"Xóa có lỗi";
		}
    }
	if(obj.id=="pro_HRTI01701_3")
    {
        if(txtCloseTime.text == "Y")
		{
			lblStatus.text = (v_language =="ENG")?"Working month already closed":"Công tháng đã được đóng";
			idBtnProcess.SetEnable(false);
			idBtnDelete.SetEnable(false);
		}
		else
		{
			lblStatus.text = "";
			idBtnProcess.SetEnable(true);
			idBtnDelete.SetEnable(true);
		}
    }
}
function OnDataError(obj) 
{
	
	if(obj.id == "pro_HRTI01701_0")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
}
function OnChangeTimes()
{
	pro_HRTI01701_3.Call();
	 
}
//=======================================================================
</script>

<body>
<!------------------------------------------>

<gw:data id="pro_HRTI01701_0" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	<xml>
		<dso  type="process" procedure="ST_HR_PRO_HRTI01701_0"  > 
			<input>
				<input bind="dtMonth" />
				<input bind="dtFrom_Date" />
				<input bind="dtTo_Date" />
				<input bind="lstOrg" />
				<input bind="lstSalaryPeriod" />
				<input bind="txtEmployee" />
			</input> 
			<output>
				<output bind="txtResult" />
			</output>
		</dso> 
	</xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="pro_HRTI01701_1" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
	<xml>
		<dso  type="process" procedure="ST_HR_PRO_HRTI01701_1"  > 
			<input>
				<input bind="dtMonth" />
				<input bind="dtFrom_Date" />
				<input bind="dtTo_Date" />
				<input bind="lstOrg" />
				<input bind="lstSalaryPeriod" />
				<input bind="txtEmployee" />
			</input> 
			<output>
				<output bind="txtResult" />
			</output>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="pro_HRTI01701_3" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01701_3" > 
                <input>
                    <input bind="lstOrg" />
                    <input bind="dtMonth" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="dtFrom_Date" />
                    <output bind="dtTo_Date" />
                    <output bind="lblDateFromTo" />
                    <output bind="txtCloseTime" />
                    <output bind="txtProcess" />
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
							Process Working Monthly
						</td>
					</tr>
					<tr style="height: 3%">
						<td colspan=4 style="font-size: large; color: Blue;width:100%" align="center">
							<gw:label id="lblDateFromTo" text="" maxlen="100" styles="width:100%;color:blue" ></gw:label>
						</td>
					</tr>
					<tr style="height: 85%">
						<td colspan=4 >
							<table style="width:100%;height:100%;">
								<tr style="height: 5%">
									<td   align="right" width="30%" >Month</td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:datebox id="dtMonth" type=month lang="<%=Session("Lang")%>" styles="width:50%" onchange="OnChangeTimes()" ></gw:datebox>
									</td>
								</tr>	
								<tr style="height: 5%">
									<td   align="right" width="30%" >Period</td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:list  id="lstSalaryPeriod" maxlen = "100" styles='width:100%' onchange="OnChangeTimes()" ></gw:list>
									</td>
								</tr>	
								<tr style="height: 5%" >
									<td   align="right" width="10%" >Organization </td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:list  id="lstOrg" styles='width:100%'  />
									</td>
								</tr>
								<tr style="height: 5%" >
									<td   align="right" width="10%" >Employee </td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:textbox id="txtEmployee"  styles="width:100%"  />
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
							<gw:button id="idBtnProcess" img="process" text="Process" onclick="OnProcess()" />
						</td>
						<td   align="center" width="25%" >  
							<gw:button id="idBtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
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
	<gw:textbox id="txtCloseTime" styles="display:none"/>
    <gw:textbox id="txtProcess" styles="display:none"/> 
	<gw:textbox id="dtFrom_Date"  text="" styles="width:100%;display:none"   />
	<gw:textbox id="dtTo_Date"  text="" styles="width:100%;display:none"   />
</body>
<!---------------------------------------------------------------------->
</html>
