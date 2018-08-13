<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Contract Detail Preparation [Contruction]</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    
	System.Translate(document);
	BindingDataList();
	var p_Code = "<%=Request.querystring("Code")%>"; 
	var p_Pk = "<%=Request.querystring("pk")%>"; 
	var p_Project_Pk = "<%=Request.querystring("Project_Pk")%>"; 
    
	txtCode.SetDataText(p_Code);
	txtProject_Pk.SetDataText(p_Project_Pk);
	txtPk.SetDataText(p_Pk);
    
	OnShowHide();
	dso_search.Call();
}
//===================================================================================
function BindingDataList()
{

	txtRawMtrlCost.text = '100';
	txtLaborCost.text = '100';
	txtExp.text = '100';
	txtRate.text = '100';
}
//===================================================================================
function OnShowHide()
{
	if(txtCode.text == 'E')
	{
		r.style.display= "";
		r1.style.display= "";
		
		a.style.display= "none";
		b.style.display= "none";
		c.style.display= "none";
		d.style.display= "none";
		e.style.display= "none";
		f.style.display= "none";
	}
	else
	{
		r.style.display= "none";
		r1.style.display= "none";
		a.style.display= "";
		b.style.display= "";
		c.style.display= "";
		d.style.display= "";
		e.style.display= "";
		f.style.display= "";
	}
}
function OnCalc()
{
        dso_Calc.Call();
}
function OnDataReceive(obj)
{
        switch(obj.id)
       {
                case 'dso_Calc':
                        window.close();
              break;  
       } 
}
</script>
<body>
<gw:data id="dso_search" onreceive="">
  <xml>
    <dso type="process"  procedure="sp_sel_kpcs311_4status2"  >
      <input>
		  <input bind="txtProject_Pk"/>
		  <input bind="txtPk"/>
     </input>
	 <output>
     	  <output bind="lstOrderWDiv"/>
		  <output bind="lstRegWDiv"/>
          <output bind="txtOrderAmt"/>
          <output bind="txtContAwdAmt"/>
          <output bind="txtContAwdRate"/>
          <output  bind="txtccy" /> 
	  </output>
    </dso>
  </xml>
</gw:data>

 <gw:data id="dso_Calc" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process"   procedure="sp_upd_311_4status2_cal"> 
                <input> 
                     <input  bind="txtProject_Pk" />
                     <input  bind="txtPk" />
                     <input  bind="txtCode" />
                      <input  bind="txtRawMtrlCost" />
                     <input  bind="txtLaborCost" />
                     <input  bind="txtExp" /> 
                     <input  bind="txtRate" />
                      <input  bind="txtccy" /> 
                     <input  bind="txtOrderAmt" />
                </input>
              <output>
                    <output bind="txtRtn"/>
                </output >
            </dso> 
        </xml> 
    </gw:data>
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
		<tr height="2%">
        			<td>
                    		<fieldset style="padding:0">
                    			<table cellpadding="0" cellspacing="0" width="100%">
                                			<tr>
                                            			<td width="100%"></td>
                                                        <td><img src="../../../system/images/calculator.png" style="cursor:pointer" alt="open calculator"  onclick="OnCalc()" /></td>
                                            </tr>
                                </table>
                                </fieldset>
                    </td>
        </tr>
        <tr height="98%">
        		<td valign="top">
                			<table cellpadding="0" cellspacing="0" width="100%" border="1" style="border-collapse: collapse" bordercolor="#00CCFF">
                                        <tr style="background:#C5EFF1" >
                                        			<td align="right" width="12%" title="Order Work Division">Order W. Div.&nbsp;</td>
                                                    <td width="35%"><gw:textbox id="lstOrderWDiv"   styles='width:100%' /></td>
                                                    <td align="right" width="15%" title="Order Amount">Order Amt&nbsp;</td>
                                                    <td width="38%"><gw:textbox id="txtOrderAmt"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                        <tr style="background:#C5EFF1" >
                                        			<td align="right" width="" title="Registered Work Division">Reg. W. Div.&nbsp;</td>
                                                    <td width=""><gw:textbox id="lstRegWDiv"   styles='width:100%' /></td>
                                                    <td align="right" width="" title="Contract Award Amount">Cont. Awd. Amt&nbsp;</td>
                                                    <td width="40%"><gw:textbox id="txtContAwdAmt"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                         <tr style="background:#C5EFF1" >
                                        			<td align="right" width="" title="Contracted Company">Cont. Co.&nbsp;</td>
                                                    <td width=""><gw:textbox id="txtContType"   styles='width:100%' /></td>
                                                    <td align="right" width="" title="Contract Award Rate">Cont. Awd. Rate&nbsp;</td>
                                                    <td width=""><gw:textbox id="txtContAwdRate"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
										<tr style="background:#C5EFF1" >
                                        			<td align="right" width="" title="Calculation Method">Calc. Method&nbsp;</td>
                                                    <td width="" colspan="3"><gw:radio id="rdoCalcMethod" value="2" > <span value="2"><a title="Main Contract" style="color:Black">Order Detail</a></span></gw:radio ></td>
                                        </tr>
										<tr style="background:#C5EFF1" >
                                        			<td align="right" width="" title="Application Rate">Appl. Rate&nbsp;</td>
                                                    <td width="" colspan="3">
														<table cellpadding="0" cellspacing="0" width="100%">
															<tr>
																<td id="a" align="right" width="15%" title="Raw Material Cost">Raw Mtrl. Cost&nbsp;</td>
																<td id="b" width="15%"><gw:textbox id="txtRawMtrlCost"  type="number" format="###,###.##R"  styles='width:85%' />%</td>
																<td id="c" align="right" width="14%" >Labor Cost&nbsp;</td>
																<td id="d" width="15%"><gw:textbox id="txtLaborCost"  type="number" format="###,###.##R"  styles='width:85%' />%</td>
																<td id="e" align="right" width="8%"  title="Expenditure">Exp.&nbsp;</td>
																<td id="f" width="15%"><gw:textbox id="txtExp"  type="number" format="###,###.##R"  styles='width:85%' />%</td>
																<td id="r" align="right" width="8%" >Rate&nbsp;</td>
																<td id="r1" width="10%"><gw:textbox id="txtRate"  type="number" format="###,###.##R"  styles='width:75%' />%</td>
															</tr>
														</table>
													</td>
                                                    
                                        </tr>
                            </table>
                </td>
        </tr>
</table>
<gw:textbox id="txtCode" styles='width:100%;display:none' />
<gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
<gw:textbox id="txtPk" styles='width:100%;display:none' />
<gw:textbox id="txtRtn" styles='width:100%;display:none' />
<gw:textbox id="txtccy" styles='width:100%;display:none' />

</body>
</html>