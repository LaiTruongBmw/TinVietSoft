
<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
var emp_pk_list;
var rpt_no=0;
var ctl
function BodyInit()
{
    grdEmployee.GetGridControl().FrozenCols =5;
    
    grdEmployee.GetGridControl().ScrollTrack=true;
    
     //if (v_language!="ENG")
        System.Translate(document);	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRIS00400', 1) FROM DUAL")%>";
    lstReport.SetDataText(data);
    OnChangeOptMonth(2);
    OnChangeOptEmpID(2);

    ChangeColorItem(lstOrg.GetControl());
    
   
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                datUser_info.Call(); 
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
//-------------------------------
function OnSearch(datobj)
{
    datobj.Call("SELECT");
}
//-------------------------------
function OnDataReceive(obj)
{
    if (obj.id=="datEmpDeclaration")
    {
        lblRecord.text=grdEmployee.rows-1 ;
        auto_resize_column(grdEmployee,0,grdEmployee.cols-1,0);
    }
	else if (obj.id=="datTeamData")
   {
//        switch (tabMain.GetCurrentPageNo())
//        {
//            case 0:
//                ChoseList_box(lstWG,txtGroupData.text);
//                break;
//            case 1:
//                ChoseList_box(lstWG_2,txtGroupData.text);
//                break;
//            case 2:
//                ChoseList_box(lstWG_3,txtGroupData.text);
//                break;
//			case 3:
//                ChoseList_box(lstWG_4,txtGroupData.text);
//                break;
//        }  
//        if (binit==true)
//        {
//            binit=false;
//            ChoseList_box(lstWG,txtGroupData.text);
//            ChoseList_box(lstWG_2,txtGroupData.text);
//            ChoseList_box(lstWG_3,txtGroupData.text);
//			ChoseList_box(lstWG_4,txtGroupData.text);
//        }
        
   }
   
   else if (obj.id=="datFind_Report")
   {
       var url = System.RootURL;

       switch (txtReportCode_tmp.text) {
            case "303": //TK1_TS report
                url = url + txtReport_tmp.text + '?emp_pk=' + emp_pk_list  + '&company_pk=' + txtCompany_PK.text;   //+ "&rpt_type=" + lstReportType.value
                break;
            case "304": //01-TBH report
                url = url + txtReport_tmp.text + '?emp_pk=' + emp_pk_list + '&company_pk=' + txtCompany_PK.text;
                break;
         
       }
        window.open(url);    
   }
   else if (obj.id=="datUser_info")
   {
       
            lstOrg.SetDataText(txtdept_temp.text);
            
            ChangeColorItem(lstOrg.GetControl());
            
            onChange_org(5,lstOrg);
           

   }
   
   else if (obj.id=="datWorkGroup_info")
   {
        if(flag_tab =="1")
        {
		    lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstWG.value="ALL";
        }
        else if(flag_tab =="5")
        {
            lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstWG.value="ALL";
        }
        datOrg_Company.Call();
	}	
    else if(obj.id =="datOrg_Company")
    {
       
    }
}
//-------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//--------------------------------
function OnReport()
{
    
    
        emp_pk_list="";
        for (var i=1;i<=grdEmployee.rows-1;i++)
        {
            if (grdEmployee.GetGridData(i,0)=="-1")
            {
                emp_pk_list = emp_pk_list + grdEmployee.GetGridData(i,20) + ",";
            }   
        }
        if (emp_pk_list=="")
        {
            alert("Please choose employees to print");
            return;
        }
        else
        {
            emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
            txtReportCode_tmp.text = lstReport.value;
            txtOrg_tmp_pk.text = lstOrg.value;
            datFind_Report.Call();
            
        }
    
    
}

//------------------------------------

//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    var obj;
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//-------------------------------------------------------------
function OnChangeOptMonth(obj)
{
    txtOptionMonth.text=obj;
    if (obj==1)
    {
        dtFromJoinDate.SetEnable(false);
        dtToJoinDate.SetEnable(false);
        dtFromSTContract.SetEnable(false);
        dtToSTContract.SetEnable(false);
    }
    else
    {
        dtFromJoinDate.SetEnable(true);
        dtToJoinDate.SetEnable(true);
        dtFromSTContract.SetEnable(true);
        dtToSTContract.SetEnable(true);
    }
}
//-------------------------------------------------------------
function OnChangeOptEmpID(obj)
{
    txtOptEmpID.text=obj;
    if (obj==1)
    {
        txtEmpID.SetEnable(false);
    }
    else
    {
        txtEmpID.SetEnable(true);
        txtEmpID.GetControl().focus();
    }
}
//------------------------------------------------------------
function doSelectAll()
{	
	var tmp;
	if( chkCheckAll.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
     var ctrl = grdEmployee.GetGridControl();
    if (ctrl.SelectedRows >0)
        
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    grdEmployee.SetGridText(row,0,tmp);
			    }	
		    }
	else
	    for ( var i =  1 ; i < grdEmployee.rows ; i++ )
		    {
				    grdEmployee.SetGridText(i,0,tmp);
		    }
}
//----------------------------------
function OnChangeMonth(objrptMonth,objinsMonth)
{
    objinsMonth.value=objrptMonth.value;
}
//-----------------------------------

function OnShowPopup(n)
{
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj;
  
    }    
}/**/
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}
</script>

<body style=" margin-bottom:0; margin-top:0; margin-right:0" >
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
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datTeamData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_TEAM_DATA_ALL" > 
                <input>
                    <input bind="txtDept" /> 
                </input> 
                <output>
                    <output bind="txtGroupData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-----------------Get ID company theo Organization ------------------------>
<gw:data id="datOrg_Company" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_COM_BY_ORG" > 
                <input>
                    <input bind="txtorg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtCompany_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datEmpDeclaration" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRIS00400_0" > 
                <input bind="grdEmployee">
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="dtReportMonth" />  
                    <input bind="dtFromJoinDate" /> 
                    <input bind="dtToJoinDate" /> 
                    <input bind="dtFromSTContract" /> 
                    <input bind="dtToSTContract" />
                    <input bind="txtEmpID" />
					<input bind="lstNation" />
                    <input bind="lstSocila_YN" />
                </input> 
                <output bind="grdEmployee"/>
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
<!--------------------main table----------------------------------->

    <table name="01" id="management" cellpadding="0"  cellspacing="0" border=1 style="width:100%;height:100%">
        <tr  style="width:100%;height:100%" valign="top">
            <td  style="width:100%;height:100%">
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0;width:100%;height:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtEmpID" styles='width:100%'/>
									</td>									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Report Month
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtReportMonth" type="month"   lang="<%=Session("Lang")%>"/>
									</td>
									
								</tr>
								<tr style="border:0;width:100%;height:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
										
									</td>									
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(1,lstOrg)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFromJoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToJoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Start Contract
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFromSTContract" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToSTContract" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>									
								</tr>
								<tr style="border:0;width:100%;height:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Nation
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list id="lstNation" styles="color:black;width:100%" value="01" onchange=""> 
										   <data>
												<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...
											</data>
									   </gw:list > 
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Social No YN
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstSocila_YN" value='3' maxlen = "100" styles='width:100%' >
											<data>
												|1|Yes|2|No|3|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
									
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"  >
								<gw:checkbox id="chkCheckAll" value="F" onclick="doSelectAll()" ></gw:checkbox >
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								<gw:label id="lblRecord"  text="" maxlen = "100"  />
							</td>
							<td colspan=65 width="65%" style="border:0"  align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="search" id="ibtnSearch" text="Search"   alt="Search"  onclick="OnSearch(datEmpDeclaration)"/>
							</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport()"/>
							</td>
							<td colspan=10 width="10%" style="border:0"> 
								<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:81%">
					<table cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr style="border:1;width:100%;height:100%" valign="top">
							<td  style="width:100%;height:100%;"> 
							  <gw:grid id='grdEmployee'
								header='Select|Team/Section|Emp ID|Full Name|Male|Female|Birth Date|Ethnic|Nation|Permanent Addr|Current Addr|Person ID|Person ID Place|Issued Date|Health No|Health Place|Start Month|End Month|Postion|SALARY|_EmpPK'
								format='3|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|1|0'
								aligns='0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								defaults='|||||||||||||||||||||'
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								widths='1000|1500|1000|2500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
								sorting='T'
								styles='width:100%; height:100%'
								/>
							</td>
						</tr>
					</table>
				</div>
            </td>
        </tr>
    </table>

 
</body>
 
<gw:textbox id="txtOptionMonth" styles="display:none" text="1"/>
<gw:textbox id="txtOptEmpID" styles="display:none" text="1"/>
<gw:textbox id="txtReport_tmp" styles="display:none" text="1"/>
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/> 
<gw:textbox id="txtdept_temp" styles="display:none"/> 

<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 

<gw:textbox id="txtCompany_PK" styles="display:none"/>
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
</html>
