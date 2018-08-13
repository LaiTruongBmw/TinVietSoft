<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <script>
 
 function BodyInit()
{
   
	System.Translate(document);
    BindingDataList();
	txtAc_level.text= "<%=session("ACNT_LEVEL")%>";
    txtUser_pk.text = "<%=session("USER_PK")%>";
	datCompany.Call();
   /* if(txtAc_level.text=='6')
    {
        var ls_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
        lstCompany.SetDataText(ls_data);
    }
    else //if(txtAc_level.text=='3')
    {
        datCompany.Call();
    }
	System.Translate(document);
    BindingDataList();*/
    //OnSearch();
}

function BindingDataList()
{ 
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
}

function OnSearch()
{
    waag031000.Call();
}

function OnSave()
{
    waag031000_1.Call();
}

function Error(dataid)
{
    if (dataid == "waag031000_1")
	{
		var tmp = waag031000_1.errmsg;
		if(tmp.length == 27)
			alert("Procedure not yet compile");
		else
		{
			if(tmp != "")
			{
				var error = waag031000_1.errmsg.substr(11,34);
				alert(error);
			}
		}
	}
	
}
//---------------------------------------------------------
 function OnDataReceive(oId)
 {
    switch(oId.id)
    {
        case "datCompany":            
            waag031000.Call();
        break;
    }
 }

</script>
<body style="margin:0; padding:0;">
 
    <gw:data id="waag031000"  onreceive=""> 
    <xml> 
        <dso id="1" type="process" procedure="AC_pro_60070020_MONTH_CLOSE" > 
            <input> 
                 <input  bind="lstCompany" />
                 <input  bind="dtb_YYYY" />
            </input>  
            <output>  
                 <output  bind="chkMon1" />
                 <output  bind="chkMon2" />
                 <output  bind="chkMon3" />
                 <output  bind="chkMon4" />
                 <output  bind="chkMon5" />
                 <output  bind="chkMon6" />
                 <output  bind="chkMon7" />
                 <output  bind="chkMon8" />
                 <output  bind="chkMon9" />
                 <output  bind="chkMon10" />
                 <output  bind="chkMon11" />
                 <output  bind="chkMon12" />
           </output> 
        </dso> 
    </xml> 
    </gw:data> 


    <gw:data id="waag031000_1"  onreceive="" onerror="Error('waag031000_1')"> 
    <xml> 
        <dso id="1" type="process" procedure="AC_UPD_60070020_MONTH_CLOSE" > 
            <input> 
                 <input  bind="lstCompany" />
                 <input  bind="dtb_YYYY" />
                 <input  bind="chkMon1" />
                 <input  bind="chkMon2" />
                 <input  bind="chkMon3" />
                 <input  bind="chkMon4" />
                 <input  bind="chkMon5" />
                 <input  bind="chkMon6" />
                 <input  bind="chkMon7" />
                 <input  bind="chkMon8" />
                 <input  bind="chkMon9" />
                 <input  bind="chkMon10" />
                 <input  bind="chkMon11" />
                 <input  bind="chkMon12" />
            </input>  
            <output>  
                 <output  bind="chkMon1" />
                 <output  bind="chkMon2" />
                 <output  bind="chkMon3" />
                 <output  bind="chkMon4" />
                 <output  bind="chkMon5" />
                 <output  bind="chkMon6" />
                 <output  bind="chkMon7" />
                 <output  bind="chkMon8" />
                 <output  bind="chkMon9" />
                 <output  bind="chkMon10" />
                 <output  bind="chkMon11" />
                 <output  bind="chkMon12" />
           </output> 
        </dso> 
    </xml> 
    </gw:data> 
    
    
    <gw:data id="datCompany" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ac_sel_60130130_entry"  > 
                <input>
                    <input bind="txtUser_pk" />
                </input> 
                <output>
                    <output bind="lstCompany" />
                </output>
            </dso> 
        </xml> 
    </gw:data>

<!-- MainTable -->
<table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
	<tr style='height:2%'>
		<td width="100%">
						<!-- Table1 contain master buttons and text box -->
						<table id="LeftTopTB" height="20" width="100%" border="0">
								<tr>
										<td width="40%">
											<table id="Table1" height="20" width="100%">
												<tr>
													<td width="40%" align="right">Company</td>
													<td width="60%">
														<gw:list id="lstCompany" onchange="OnSearch()" styles='width:100%'></gw:list >
													</td>
												</tr>
											</table>
										</td>
										<td width="40%">
											<table id="Table2" height="20" width="100%">
												<tr>
													<td width="40%" align="right">Year</td>
													<td width="60%"><gw:datebox id="dtb_YYYY" mode="01" type="year" styles='width:50%' onchange="OnSearch()"/></td>
													
												</tr>
											</table>
										</td>
										<td width="14%"></td>
										<td width="3%"><gw:imgBtn img="search" alt="Search" id="btnSearch"	styles='width:100%' onclick="OnSearch()" /></td>
										<td width="3%"><gw:imgBtn img="save"   alt="Save"   id="btnSave"                        onclick="OnSave()" /></td>
								</tr>
						</table>
						<!-- End of Table1--->
		</td>
	</tr>
	<tr style='height:98%'>
		<td width="100%" height="450" >
						<!-- Table1 contain master grid -->					
						<table width="100%" border="0">
							<tr>
								<td width="100%" height="450">
										<table id="LeftBottomTB" width="100%" border="0">
												<tr>
													<td width="100%">
															<table width="100%">
																<tr>
																	<td width="11%"></td>
																	<td width="13%" align="center" bgcolor="#99ccff">January</td>
																	<td width="13%" align="center" bgcolor="#99ccff">February</td>
																	<td width="13%" align="center" bgcolor="#99ccff">March</td>
																	<td width="13%" align="center" bgcolor="#99ccff">April</td>
																	<td width="13%" align="center" bgcolor="#99ccff">May</td>
																	<td width="13%" align="center" bgcolor="#99ccff">June</td>
																	<td width="11%"></td>
																</tr>
															</table>
													</td>
												</tr>
												<tr>
													<td width="100%">
															<table width="100%">
																<tr>
																	<td width="11%"></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon1" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon2" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon3" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon4" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon5" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon6" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="11%"></td>
																</tr>
															</table>
													</td>
												</tr>
												
												<tr>
													<td width="100%">
															<table width="100%">
																<tr>
																	<td width="11%"></td>
																	<td width="13%" align="center" bgcolor="#99ccff">July</td>
																	<td width="13%" align="center" bgcolor="#99ccff">August</td>
																	<td width="13%" align="center" bgcolor="#99ccff">September</td>
																	<td width="13%" align="center" bgcolor="#99ccff">October</td>
																	<td width="13%" align="center" bgcolor="#99ccff">November</td>
																	<td width="13%" align="center" bgcolor="#99ccff">December</td>
																	<td width="11%"></td>
																</tr>
															</table>
													</td>
												</tr>
												<tr>
													<td width="100%">
															<table width="100%">
																<tr>
																	<td width="11%"></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon7" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon8" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon9" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon10" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon11" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="13%" height="50" align="center" bgcolor="#ccffff"><gw:checkbox id="chkMon12" value="N" defaultvalue="Y|N" /><font color="black" >&nbsp;&nbsp;</font></td>
																	<td width="11%"></td>
																</tr>
															</table>
													</td>
												</tr>
												
												
												
											</table>
											<!-- end -->
								</td>
							</tr>
						</table>
					<!-- End of Table1-->	
		</td>
	</tr>	
	
</table>

<gw:textbox id="txt_temp" maxlen="100" styles='width:100%;display:none' csstype="" />
<gw:textbox id="txtAc_level" styles='display:none' />
<gw:textbox id="txtSesion_company" styles='display:none' />
<gw:textbox id="txtUser_pk" styles='display:none' />
 </body>
 </html>