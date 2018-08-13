<!-- #include file="../../../../system/lib/form.inc" -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>Untitled Page</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>

<script>
var startTime,interval_time
var v_language = "<%=Session("SESSION_LANG")%>";
var user;
var opt_value=2;
var flag_tab=1;
var check_init=0;
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);	
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
	 user = "<%=session("USER_ID")%>";
     menu_id.text=System.Menu.GetMenuID();
      lstOrg_Code.value="ALL";
	  lstWGrp_Code.value="ALL";
	  //ibtnAdd.SetEnable(false);
	 
//     imgMaster.src = "../../../../system/images/close_popup.gif";
//	 imgMaster.alt="Close Employees"; 
  
	 BindingDataList();
	 ChangeColorItem(lstOrg_Code.GetControl());
     datCheck_View.Call();

     grdRelative.GetGridControl().ScrollTrack=true;	
//     grdEmp.GetGridControl().ScrollTrack=true;	
     grdRelative.GetGridControl().FrozenCols =4;
     <%=CtlLib.SetGridColumnComboFormat("grdRelative",6,"select code,CODE_NM from vhr_hr_code where id='HR0024' order by code_nm") %>
	 <%=CtlLib.SetGridColumnComboFormat("grdRelative",8,"select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm") %>	

}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM01100', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWGrp_Code.SetDataText(data);
	lstWGrp_Code.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0108', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstJob.SetDataText(data);
	lstJob.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0024', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstRelationship.SetDataText(data);
	lstRelationship.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('YN', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstDepend.SetDataText(data);
	lstDepend.value ="ALL";
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
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenX+';edge:sunken;scroll:yes;unadorned:yes;help:no');
	var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
		lstOrg_Code.value=obj;
		onChange_org(1,lstOrg_Code)
   
    }
}

function OnChangeDept()
{
    //datTeamData.Call();
}

function OnDataReceive(obj)
{
       if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                ibtnAdd.style.display = "none";
                ibtnSave.style.display = "none";
                ibtnDelete.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }
            check_init =1;
       }
       else if (obj.id=="datUser_info")
       {
            ChangeColorItem(lstOrg_Code.GetControl());
            onChange_org(1,lstOrg_Code);
       }

       else if (obj.id=="datRelative")
       {
            lblRecord.text=grdRelative.rows-1 ;
             var fg=grdRelative.GetGridControl(); 	  
             fg.MergeCells =3	;
            fg.MergeCol(1) =true	;
            fg.MergeCol(2) =true	;
            fg.MergeCol(3) =true	;
            fg.MergeCol(4) =true	;
       }
       else if (obj.id=="datFind_Report")
       {
			if(txtReportCode_tmp.text == "31") 
			{	
				var url=System.RootURL + txtReport_tmp.text + '?l_user=' + user ;
				 url += '&l_tco_org_pk='+ lstOrg_Code.value +'&l_wgroup_pk='+lstWGrp_Code.value;
				 url += '&l_temp=' + txtEmployee.text + '&l_status=' + lstStatus.value + '&l_relation=' 				  
				 +lstRelationship.value + '&l_start_dt=' + dtFromDT.value+ '&l_end_dt=' 
				 + dtToDT.value+ '&l_thr_emp_pk=' + txtEmp_PK.text;   
				 url +='&p_job=' + lstJob.value + '&p_Nation=' + lstNation.value +'&l_depend='+ lstDepend.value ;
				 url += '&p_lang=' + v_language;
			}
            
		 window.open(url);
       }
	   else if (obj.id=="datWorkGroup_info")
	   {
			lstWGrp_Code.SetDataText(txtwg_tmp.text + "|ALL|Select All");
            lstWGrp_Code.value ="ALL";
			check_init=1;
	   }
	   
}      

function OnSearch()
{
	if(check_init==1)
	{
		//if (imgMaster.status == "expand")
			datRelative.Call('SELECT');
		//else    
			//datRelative.Call('SELECT');
	}		
}

function OnAdd()
{
	var path = System.RootURL + '/standard/forms/hr/em/hrem01101.aspx';
	var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
}

function OnDelete()
{
	if(check_init==1)
	{
		grdRelative.DeleteRow();
	}	
}

function OnSave()
{
	if(check_init==1)
	{
		if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn sẵn sàng lưu dữ liệu?"))
			datRelative.Call();
	}	
}

//----------------------------------------------

function OnReport(obj)
{
	if(check_init==1)
	{
		if(lstReport.value =="31") 
		{	
			txtReportCode_tmp.text = lstReport.value;
			txtOrg_tmp_pk.text=lstOrg_Code.value;
		}
			
		datFind_Report.Call();
			
	}	
}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}
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
                    <output bind="lstOrg_Code" />
                </output>
            </dso> 
        </xml> 
</gw:data>

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
<gw:data id="datRelative" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" parameter="0,1,5,6,7,8,9,10,11,12,13,14,15,16" function="ST_HR_SEL_HREM01100_1" procedure="ST_HR_UPD_HREM01100_1"> 
                <input bind="grdRelative">
                    <input bind="lstOrg_Code" />
                    <input bind="lstWGrp_Code" />
                    <input bind="txtEmployee" />
                    <input bind="lstStatus" />
                    <input bind="lstRelationship" />
                    <input bind="dtFromDT" />
                    <input bind="dtToDT" />
                    <input bind="txtEmp_PK" /> 
					<input bind="lstNation" />
					<input bind="lstJob" />
					<input bind="lstDepend" />
                </input> 
                <output bind="grdRelative"/>
            </dso> 
        </xml> 
</gw:data>



<!--------------------main table----------------------------------->
<table  width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
    <tr style="width:100%;height:100%" valign="top">
        <td>
			<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
				<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>	
				<table width="100%" id="tblexp" style="height:100%" cellpadding="0" cellspacing="0">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							Employee
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							<gw:textbox id="txtEmployee" onenterkey ="OnSearch()" styles='width:100%'/>
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 style="border:0" width="12%" align="left" >
							Nation
						</td>
						<td colspan=20 style="border:0" width="20%"  align="left" >
							<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
						<td colspan=20 width="20%" style="border:0"> 
							<gw:list  id="lstStatus"  value='A'  maxlen = "100" styles='width:100%' />   
						</td>
					</tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0" align="left"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips"  >
								Organization</a>
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							<gw:list id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(1,lstOrg_Code)" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 style="border:0" width="12%" align="left" >
							Effected Date
						</td>
						<td colspan=20 width="20%" style="border:0" align="left">
							<gw:datebox id="dtFromDT" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							~
							<gw:datebox id="dtToDT" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
						</td>
						
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							Depend Flag
						</td>
						<td colspan=20 width="20%" style="border:0"> 
							<gw:list  id="lstDepend"  value='ALL' maxlen = "100" styles='width:100%' />
						</td>
					</tr>
				</table>
				</fieldset>
			</div>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:5%">
				<table width="100%"  style="height:100%" cellpadding="0" cellspacing="0">
					<tr style="border:0;width:100%;height:4%" valign="center">
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=5 width="5%" style="border:0"  >Rows:</td>
						<td colspan=5 width="5%" style="border:0"> 
							<gw:label id="lblRecord" text="" maxlen = "100" ></gw:label>
						</td>
						<td colspan=55 width="55%" style="border:0"  >

						</td>
						<td colspan=5 width="5%" style="border:0"  >
							<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0"  >
							<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave()" />
						</td>
						<td colspan=5 width="5%" style="border:0"  >
							<gw:button id="ibtnDelete" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" />
						</td>
						<td colspan=5 width="5%" style="border:0" >
							<gw:button id="ibtnAdd" alt="Add" img="new" text="Add New" onclick="OnAdd()" />
						</td>
						<td colspan=5 width="5%" style="border:0"  >
							<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
				<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
					<tr style="width:100%;height:100%">
						<td id="tdMaster" width="100%">
							<gw:grid
									id="grdRelative"
									header="_PK|_EMP PK|Organization|Emp ID|Full Name|Name|Relation|Birth Date|Birth Place|Address|Telephone|Job|Salary|_Remark|Depend Flag|Start Date|End Date"   
									format="0|0|0|0|0|0|0|0|0|0|0|0|1|0|3|4|4"  
									aligns="0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="|||||||||||||||"  
									editcol="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1"  
									widths="0|0|1600|1200|2500|2500|1200|1200|1200|3000|1200|1400|1300|2000|1300|1300|1300"  
									styles="width:100%; height:100%"   
									sorting="T"   
									acceptNullDate
								   /> 
						</td>
					</tr>	
			   </table> 
			</div>
		</td>
	</tr>
</table>
    <gw:textbox id="txtResult" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
	<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
	<gw:textbox id="txtorg_tmp" styles="display:none"/>
	<gw:textbox id="txtwg_tmp" styles="display:none"/> 
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  /> 
	<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
	<gw:list id="lstJob" value='ALL' maxlen = "100" styles="display:none" />
	<gw:list  id="lstRelationship"  value='ALL' maxlen = "100" styles="display:none" value="551" />
	<gw:list  id="lstWGrp_Code" value='ALL' maxlen = "100" styles="display:none" />
	<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""styles="display:none"/>
</body>

</html>
