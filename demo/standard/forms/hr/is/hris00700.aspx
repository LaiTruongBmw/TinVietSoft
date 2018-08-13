<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var binit=true;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
   grdRegulation.GetGridControl().FrozenCols =4;
   grdRegulation.GetGridControl().ScrollTrack=true;
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
   user="<%=session("USER_ID")%>";
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRIS00700', 1) FROM DUAL")%>";
    lstReport.SetDataText(data);
   ChangeColorItem(lstOrg.GetControl());

   if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
    {
        datUser_info.Call();     	    
    }
    
   
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

//--------------------------
function OnSearch()
{
    datRegProgressive.Call("SELECT");
}
//------------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id =="datUser_info")
   {
        ChangeColorItem(lstOrg.GetControl());
        onChange_org(2,lstOrg);
   }
   else if (obj.id=="datRegProgressive")
   {
        lblRecord.text=grdRegulation.rows-1 ;
   }
   else if(obj.id =="datWorkGroup_info")
    {
        if(flag_tab =="1")
        {
		    lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstWG.value="ALL";
        }
        else if(flag_tab =="2")
        {
            lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstWG.value="ALL";
           
        }
   }
   else if (obj.id == "datFind_Report") {
       var url = System.RootURL;

       switch (txtReportCode_tmp.text) {
           case "306": 
               url = url + txtReport_tmp.text + '?p_tco_org=' + lstOrg.value + '&p_thr_wg_pk=' + lstWG.value + '&p_status=' + lstStatus.value;
               url = url + '&p_year=' + dtYear.value + '&p_detail_regulation_type=' + lstRegulation_Type.value + '&p_search_temp=' + txtTemp.text;
               break;

       }
       window.open(url);

   }
}
//-----------------------------------------------
function OnReport() {
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();
}
//----------------------------------------------
function OnPopup()
{
    var col=event.col;
    var row=event.row;
    var emp_pk=grdRegulation.GetGridData(row,20);
    var ins_month=String(dtYear.value) + AddZero(col-7);
    var reg_type=lstRegulation_Type.value;
    if(col>=8)
    {  
        var fpath = System.RootURL + "/form/ch/di/chdi00070_detail.aspx?emp_pk=" + emp_pk + "&ins_month=" + ins_month + "&reg_type=" + reg_type;
        var obj=System.OpenModal( fpath , 900 , 400 , 'resizable:yes;status:yes') ;
    }    
}
//--------------------------------------
function AddZero(tmp)
{
    if (tmp<=9)
        return "0" + String(tmp);
    else
        return String(tmp);
}
function ChoseList_box(obj_list,value)
{
    
    obj_list.SetDataText(value);
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}

function OnShowPopup(num)
{
    if(num==1)
    {
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(num==1)
                lstOrg.value=obj;           
        }    
    }
}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
}
</script>
<body >
<!------------main control---------------------->
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datRegProgressive" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRIS00700_0" > 
                <input bind="grdRegulation">
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="txtTemp" /> 
                    <input bind="dtYear" /> 
                    <input bind="lstRegulation_Type" /> 
                    <input bind="lstStatus" />
                </input> 
                <output bind="grdRegulation"/>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
            <input>
                <input bind="txtReportCode_tmp" /> 
				<input bind="txtOrg_tmp_pk" /> 
            </input> 
            <output>
                <output bind="txtReport_tmp" />
            </output>
        </dso> 
    </xml> 
</gw:data>
<!-------------------data control----------------------->
  <table  id="management" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
									</td>									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWG"  value="ALL" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Detail Reg Type
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstRegulation_Type"  maxlen = "100" styles='width:100%'  >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0055'")%>
											</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg" maxlen = "100" styles='width:100%' onchange="onChange_org(1,lstOrg)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Year
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtYear" type="year" styles='width:100%' lang="<%=Session("Lang")%>"/>
									</td>									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Status
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:100%' >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022'")%>|ALL|Select All
											</data>
										</gw:list>
									</td>									
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"  >
									
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								<gw:label id="lblRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=70 width="70%" style="border:0"  align="left" >
								<gw:label id="lblCloseYN"  text="" maxlen = "100" />
							</td>	
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="search" id="ibtnSearch" text="Search"   alt="Search"  onclick="OnSearch()"/>
							</td>							
							<td colspan=5 width="5%" style="border:0"> 
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport()"/>
							</td>						
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table cellspacing=0 cellpadding=0 style="height:99%" width=100% border=0>
						<tr style="border:1;width:100%;height:85%" valign="top">
							<td colspan=100  style="width:100%;height:100%;"> 
								 <gw:grid id='grdRegulation'
									header='ORGANIZATION|Work-GROUP|EMP ID|FULL NAME|JOIN DT|REGULATION|SOCIAL NO|PROGRESSIVE|JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC|_THR_EMP_PK'
									format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
									aligns='0|0|1|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|0'
									defaults='||||||||||||||||||||'
									editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
									widths='1485|1830|1290|2325|1185|1530|1380|1245|735|735|735|735|735|735|735|735|735|735|735|735|1000'
									sorting='T'
									styles='width:100%; height:100%'
									oncelldblclick = "OnPopup()"
									/>
							</td>
						</tr>
					</table>
				</div>
        </td>
    </tr>
</table>
    
</body>
<gw:textbox id="txtresult" styles="display:none"/>
<gw:textbox id="txtfromdt" styles="display:none"/>
<gw:textbox id="txttodt" styles="display:none"/>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
<gw:textbox id="txtUpperDept" styles="display:none"/>

<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/>
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
	<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' />
</html>
