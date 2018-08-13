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
var opt_value=2;

function BodyInit()
{   
   
    //if (v_language!="ENG")
		System.Translate(document);	
	 iduser_pk.text = "<%=session("USER_PK")%>";
	 txtHr_level.text= "<%=session("HR_LEVEL")%>";
	 menu_id.text=System.Menu.GetMenuID();
	 data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM01000', 1) FROM DUAL")%>";
	 lstReport.SetDataText(data);
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	 lstOrg.SetDataText(data);
	 lstOrg.value="ALL";
	 ChangeColorItem(lstOrg.GetControl());
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	 lstWg.SetDataText(data);
	 lstWg.value="ALL";
	  
	 data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	 lstStatus.SetDataText(data);
	 lstStatus.value ="A";
			
	 idGridChild.GetGridControl().ScrollTrack=true;	
	 idGridEmp.GetGridControl().ScrollTrack=true;
          
     	
     datCheck_View.Call();
}


//----------------------------------------------
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
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:260;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj;
    
    }
}


function OnDataReceive(obj)
{
       if(obj.id == "datCheck_View")
        {
                if(txtFlag_View.text == 'Y')
                {
                    ibtnSave.style.display = "none";
                    ibtnDelete.style.display = "none";
                    ibtnAdd.style.display = "none";
                }
        
                if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
              datUser_info.Call(); 
            
        }
       else if (obj.id=="datMasterEmp")
       {
            idRecord.text=idGridEmp.rows-1 ;
             if (idGridEmp.rows==2)
                txtEmp_PK.text=idGridEmp.GetGridData(1,0);
       }
       else if (obj.id=="datFind_Report")
       {
           var url = System.RootURL;

           switch (txtReportCode_tmp.text) {
               case "233":
                   url = url + txtReport_tmp.text + '?p_org=' + lstOrg.value + '&p_wg=' + lstWg.value + '&p_value=' + txtSearch.text + '&p_from=' + FromDT.value + '&p_to=' + ToDT.value + '&p_status=' + lstStatus.value;
                   break;
           }

           window.open(url);
       }
	   else if (obj.id=="datUser_info")
		{
            ChangeColorItem(lstOrg.GetControl());
		}
       else if (obj.id=="datMasterEmpInList")
            idRecord.text=idGridEmp.rows-1 ;
	   
}      

function OnSearch()
{
     
    if (opt_value == 2)
    {
        idGridEmp.ClearData();
        idGridChild.ClearData();
        datMasterEmp.Call("SELECT");
        //alert(option_P.value);
    }
    else
    {
        idGridEmp.ClearData();
        idGridChild.ClearData();
        datMasterEmpInList.Call("SELECT");
    }
    
}

function OnAdd()
{
    //alert(txtEmp_PK.text);
    if(txtEmp_PK.text=="")
    {
        alert("Please select employee to add new");
        return;
    }
    idGridChild.AddRow();
    idGridChild.SetGridText(idGridChild.rows-1,1,txtEmp_PK.text);
}

function OnDelete()
{
    idGridChild.DeleteRow();
}

function OnSave()
{
    datLoadChildrenFromEmp.Call();
}

function OnReport()
{
}

function onClickOption(obj)
{
    opt_value = obj;
    switch(obj)
    {
        case 1:
            idGridEmp.ClearData();
            idGridChild.ClearData();
            break;
	    case 2:
	        idGridEmp.ClearData();
	        idGridChild.ClearData();
	        break;           
    }
}

function LoadChildren()
{
   if (idGridEmp.rows-1 > 0)
   {
        if (imgMaster.status=="expand")
        {
            txtEmp_PK.text=idGridEmp.GetGridData(idGridEmp.row,0);
            ibtnAdd.SetEnable(true);
            datLoadChildrenFromEmp.Call("SELECT");
        }
    }
}

function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            detail.style.display="none";
            imgMaster.status = "collapse";
			tbl.style.width="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show detail"
			ibtnAdd.SetEnable(false);
          /*  tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="95%";*/
            
        }
        else
        {
            detail.style.display="";
            imgMaster.status = "expand";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Close detail"
			tbl.style.width="55%";
			ibtnAdd.SetEnable(true);
			//datWorkSchedule_detail.Call("SELECT")
          /*  tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="45%";
            tblMaster.style.height="50%";*/
            
        }
  
}

function OnReport()
{
    
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();
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
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datMasterEmp" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRPM01000_0" > 
                <input bind="idGridEmp" >
                    <input bind="lstOrg" />
                    <input bind="lstWg" />
                    <input bind="txtSearch" />
                    <input bind="lstStatus" /> 
                </input>
                <output  bind="idGridEmp" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datMasterEmpInList" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRPM01000_1" > 
                <input bind="idGridEmp" >
                    <input bind="lstOrg" />
                    <input bind="lstWg" />
                    <input bind="txtSearch" />
                    <input bind="FromDT" />
                    <input bind="ToDT" />
                    <input bind="lstStatus" /> 
                </input>
                <output  bind="idGridEmp" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datLoadChildrenFromEmp" onreceive=""  > 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6" function="ST_HR_SEL_HRPM01000_2" procedure="ST_HR_UPD_HRPM01000_2"> 
                <input bind="idGridChild">
                    <input bind="txtEmp_PK" /> 
                </input> 
                <output bind="idGridChild"/>
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

<table cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
            <td>				
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >									
									<td colspan=2 width="2%" style="border:0" >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtSearch" onenterkey ="OnSearch()" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list id="lstWg" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list id="lstStatus" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										<img status="expand" id="imgMaster" alt="Close detail" src="../../../../system/images/close_popup.gif" style="cursor:hand" onclick="OnToggle()"  />
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show Organization" onClick="OnShowPopup()" href="#tips">Organization </a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										 <gw:list id="lstOrg" value='ALL' maxlen = "100" styles='width:100%'onchange="" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="FromDT" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="ToDT" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<input type="radio" id="inList" name="option_P" value="1" onclick="onClickOption(1)" >List In
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<input type="radio" id="notInList" name="option_P" value="2" checked onclick="onClickOption(2)" >Not In List
									</td>									
								</tr>								
							</table>
					</fieldset>
				</div>
				<div style="width:100%;height:4%" >
					<table width="100%"  style="height:100%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >							
							</td>	
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord" text="" ></gw:label>
							</td>
							<td colspan=60 width="60%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnAdd" alt="Add" img="new" text="Add New" onclick="OnAdd()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnSave()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnDelete" alt="Delete" img="delete" text="Delete" onclick="OnDelete()" />
							</td>
							
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport()"/>
							</td>
							
						</tr>
					</table>
				</div>
				<div style="width:100%;height:86%" >
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:100%" valign="top">
                        <td id="tbl" colspan=60> 
                             <gw:grid
								id="idGridEmp"
								header="_EMP_PK|Group|Emp ID|Full Name|Join Date|Remarks"
								format="0|0|0|0|0|0"
								aligns="0|0|0|0|1|1"
								defaults="|||||"
								editcol="0|0|0|0|0|0"
								widths="0|1500|1500|2500|1500|1500"
								styles="width:100%;height:100%"
								sorting="T"
								onclick = "LoadChildren();"/>
                        </td>
						<td id="detail" class="eco_line_l" colspan=40 > 
                             <gw:grid
								id="idGridChild"
								header="_PK|_EMP_PK|Child Name|Birth Date|Start Date|End Date|Remarks"
								format="0|0|0|4|4|4|0"
								aligns="0|0|0|1|1|1|1"
								defaults="||||||"
								editcol="0|0|1|1|1|1|1"
								widths="0|0|2500|1500|1500|1500|1500"
								styles="width:100%;height:100%"
								sorting="T"
								 acceptNullDate
								oncelldblclick = ""/>
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
    <gw:textbox id="lbltmp" styles="display:none"/>
    <gw:textbox id="lbltmp2" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
	<gw:list  id="lstReport" value='' maxlen = "100" styles='width:100%;display:none' />
</body>

</html>
