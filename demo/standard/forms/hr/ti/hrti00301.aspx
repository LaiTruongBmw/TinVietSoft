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
	dtFrom.value = "<%=request.QueryString("dt_from")%>";
	dtTo.value = "<%=request.QueryString("dt_to")%>";
	lstCompany.value = "<%=request.QueryString("tco_company_pk")%>";
	lstWG.value = "<%=request.QueryString("wg_pk")%>";
	//lstWS.value = "<%=request.QueryString("ws_pk")%>";
    //-------------------------
	//data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('WSHIFT', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	//lstWS.SetDataText(data);
	//lstWS.value= "ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
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
	if(confirm((v_language =="ENG")?"Do you want to process data?":"Bạn muốn xử lý dữ liệu?"))
	{
		txtFlag.text='MANUAL';
		pro_hrti00301_0.Call();
	}
      
}
function OnDelete()
{
	if(confirm((v_language =="ENG")?"Do you want to delete data?":"Bạn muốn xóa dữ liệu?"))
	{
		pro_hrti00301_1.Call();
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
    if(obj.id=="pro_hrti00301_0")
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
	else if(obj.id=="pro_hrti00301_1")
    {
        if(txtResult.text == "1")
		{
			lblStatus.text = (v_language =="ENG")?"Delete success":"Xóa thành công";
		}
		else
		{
			lblStatus.text = (v_language =="ENG")?"Delete fail":"Xóa có lỗi";
		}
    }
}
//=======================================================================
</script>

<body>
<!------------------------------------------>
</gw:data>
    <gw:data id="pro_hrti00301_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI00301_0" > 
                <input>
                    <input bind="lstCompany" />
                    <input bind="lstWG" />
                    <input bind="lstWS" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtFlag" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="pro_hrti00301_1" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_pro_hrti00301_1"  > 
                <input>
					<input bind="lstCompany" />
                    <input bind="lstWG" />
                    <input bind="lstWS" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtFlag" />
                </input> 
                <output>
                    <output bind="txtResult" />
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
							Create Working Schedule
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
									<td   align="right" width="30%" >Work Group</td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:list  id="lstWG"  maxlen = "100" styles='width:100%' onchange="" />
									</td>
								</tr>	
								<tr style="height: 5%">
									<td   align="right" width="30%" >Work Shift</td>
									<td  colspan=2 align="left" class="" width="70%">
										<gw:list  id="lstWS"  maxlen = "100" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,description FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%></data>
										</gw:list>
									</td>
								</tr>	
								<tr style="height: 5%" >
									<td   align="right" width="10%" >Date </td>
									<td align="left" class="" width="35%">
										<gw:datebox id="dtFrom"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
									</td>
									<td align="left" class="" width="35%">
										<gw:datebox id="dtTo"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
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
	<gw:textbox id="txtFlag" styles="display:none" />
	<gw:list  id="lstCompany" value="" maxlen = "100" styles='width:100%;display:none' onchange="ChangeOrganization(1)" >
		<data>
			<%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and (a.pk=nvl('" + Session("COMPANY_PK") + "',a.pk) or '" + Session("HR_LEVEL") + "'='6') and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
		</data>
	</gw:list>
</body>
<!---------------------------------------------------------------------->
</html>
