<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var check_init = 0;
var v_language = "<%=Session("SESSION_LANG")%>";
var emp_pk_list;
var labour_pk_list;
var rpt_no=0;
var stt =0;
var G1_NO = stt;
	G1_ORG_NAME 		= ++stt;
	G1_EMP_ID			= ++stt;
	G1_FULL_NAME		= ++stt;
	G1_JOIN_DATE		= ++stt;
	G1_CONTRACT_NO		= ++stt;
	G1_CREATE_NEW		= ++stt;
	G1_PROBATION_TYPE	= ++stt;
	G1_OLD_CONTRACT_TYPE 	= ++stt;
	G1_NEW_CONTRACT_TYPE	= ++stt;
	G1_START_PROBATION	= ++stt;
	G1_END_PROBATION	= ++stt;
	G1_START_CONTRACT	= ++stt;
	G1_END_CONTRACT		= ++stt;
	G1_GET_SALARY		= ++stt;
	G1_SALARY_AMT		= ++stt;
	G1_ALLOW1			= ++stt;
	G1_ALLOW2			= ++stt;
	G1_ALLOW3			= ++stt;
	G1_ALLOW4	= ++stt;		
	G1_ALLOW5	= ++stt;
	G1_ALLOW6	= ++stt;
	G1_ALLOW7	= ++stt;
	G1_ALLOW8	= ++stt;
	G1_ALLOW9	= ++stt;
	G1_ALLOW10	= ++stt;
	G1_ALLOW11	= ++stt;
	G1_ALLOW12	= ++stt;
	G1_EMP_PK	= ++stt;
	G1_TIMES	= ++stt;
	G1_PK		= ++stt;
	G1_NOTE		= ++stt;
	G1_APPROVED	= ++stt;
	
function BodyInit()
{
    
    //if (v_language!="ENG")
    System.Translate(document);
    
    BindingData();
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text= "<%=session("COMPANY_PK")%>";
	var v_language = "<%=Session("SESSION_LANG")%>";
    txtLanguage.text = v_language;
    menu_id.text=System.Menu.GetMenuID();
    ChangeColorItem(lstOrg_Code.GetControl());


    datCheck_View.Call();
}
//-------------------------------------------------------------------------
function BindingData()
{
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstCurContract.SetDataText(data);
	lstCurContract.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstNation.SetDataText(data);
	lstNation.value="ALL";
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


//-------------------------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
    {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnSave_A.style.display = "none";
            ibtnSave_P.style.display = "none";

            ibtnDelete.style.display = "none";
            ibtnDelete_A.style.display = "none";
        }
		if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
		else
		{
			check_init=1;
		}
    }
   else if (obj.id=="datUser_info")
   {
        lstOrg_Code.SetDataText(txtDeptData.text);
        txtDept.text=lstOrg_Code.value;

        ChangeColorItem(lstOrg_Code.GetControl());
		check_init=1;
   }
   else if (obj.id=="datLabourContractPre")
   {
		lblRecord.text = grdLBPreparation.rows-1 ;
   }
   else if(obj.id == "datFind_Report")
   {
		
		var url = System.RootURL + txtReport_tmp.text +'?&p_org_pk=' + lstOrg_Code.value + '&p_emp_search=' + txtEmployee.text
			+ '&p_contract_type=' + lstCurContract.value + '&p_from_date=' + dtFromSign.value + '&p_to_date=' + dtToSign.value 
			+ '&p_status=' + lstStatus.value + '&p_nation=' + lstNation.value + '&p_lang=' + txtLanguage.text ;
	
		window.open(url);
   }
}

//-----------------------------------------------------
function OnSearch()
{
	if(check_init==1)
	{
		datLabourContractPre.Call("SELECT");
	}		
        
}
//-----------------------------------------------------
function OnSave(objid)
{
	
}

//---------------------------------------------------------
function OnDelete()
{
	
}

function OnReport()
{
	txtReportCode_tmp.text = "/standard/reports/hr/em/rpt_hrem01500_0.aspx";
	txtOrg_tmp.text = lstOrg_Code.value;
	
	datFind_Report.Call();
}

//---------------------------------------------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {	
        lstOrg_Code.value=obj;
			
    }
    
}

//-------------------------------------------------------------------------------------
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-------------------data control----------------------->
<gw:data id="datCheck_View" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_VIEW"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-----------------------tab labour contract preparation------------------------------->
<gw:data id="datLabourContractPre" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HREM01500_0" > 
                <input bind="grdLBPreparation">
                    <input bind="txtLanguage" />  
                    <input bind="txtEmployee" /> 
					<input bind="dtFromSign" /> 
                    <input bind="dtToSign" /> 
					<input bind="lstOrg_Code" /> 
                    <input bind="lstCurContract" />
                    <input bind="lstStatus" />
                    <input bind="lstNation" />
                </input> 
                <output bind="grdLBPreparation"/>
            </dso> 
        </xml> 
</gw:data>
<!-----------------------tab labour contract manage------------------------------->

<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReportCode_tmp" /> 
                    <input bind="txtOrg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
	<table name="Reports Contract" id="tblReport"  width="100%" cellpadding="0"  cellspacing="0"  style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5" >
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=4 width="4%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:textbox id="txtEmployee" onenterkey="OnSearch()" styles='width:100%'/>
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Current Contract
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list id="lstCurContract"  value="ALL" styles='width:100%' />	
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Status
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list id="lstStatus"  value="A" styles='width:100%' />
							</td>
						</tr>
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=4 width="4%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" class="eco_blue">
								Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'  />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Prepare Sign Date
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtFromSign"  styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtToSign" styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Nation
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%' lang="<%=Session("Lang")%>" />
							</td>
						</tr>
					</table>
					</fieldset>
				</div>
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%;">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						
						<tr style="border:0;width:100%;height:4%" valign="center" >
							
							<td colspan=5 width="5%" >
								Rows:
							</td>
							<td colspan=5 width="5%" > 
								<gw:label id="lblRecord"  text="" maxlen = "100"   />
							</td>
							<td colspan=80 width="80%" style="border:0" align="center" >
							
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" id="ibtnSave_P" text="Save"  alt="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
							</td>
						</tr>
					</table>
				</div>
				<div id="tblMainHist" style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:83%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
									id="grdLBPreparation"  
									header="NO|_PK|Organization|Emp ID|Full Name|Join Date|Contract No|_Probation Kind|Current Contract|Start Probation|End Probation|Start Contract|End Contract|Next Contract|_Salary|_ALLOW1|_ALLOW2|_ALLOW3|_ALLOW4|_ALLOW5|_ALLOW6|_ALLOW7|_ALLOW8|_ALLOW9|_ALLOW10|_ALLOW11|_ALLOW12|_EMP_PK|Times|_Contract Type"   
									format="0|0|0|0|0|4|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0"  
									aligns="1|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0"  
									defaults="||||||||||||||||||||||||||||||"  
									editcol="1|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="700|1700|1700|1200|2500|1200|1600|1600|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500"  
									styles="width:100%; height:100%"   
									sorting="T"  
									autosize="T"
									acceptNullDate
								/> 
							</td>
						</tr>
				   </table> 
				</div>   
				
            </td>
        </tr>
    </table>
	
    

 
</body>
 
  
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtEmp_PK" text="" styles="display:none"/> 
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>


<gw:textbox id="txtOrg_tmp" text="" styles="display:none"  />
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="txtForeignerYN" styles="display:none"/> 
<gw:textbox id="txtCompany_pk" styles="display:none"/> 

<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="txtLanguage" text="" styles="display:none"  />
</html>
