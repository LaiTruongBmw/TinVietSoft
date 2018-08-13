<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var strcodereturn;
var v_language = "<%=Session("SESSION_LANG")%>";
var emp_pk_list;
var print_meal=0;
function BodyInit()
{
    
    

    grdEmployee.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
        System.Translate(document);
    
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
    menu_id.text=System.Menu.GetMenuID();

    BindingDataList();
	ChangeColorItem(lstOrg_Code.GetControl());
    datCheck_View.Call();

    
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00600', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWorkGroup.SetDataText(data);
	lstWorkGroup.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstContract.SetDataText(data);
	lstContract.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('YN', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstHavePicture.SetDataText(data);
	lstHavePicture.value ="ALL";
	
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
                        lstctl.options.item(i).style.color = "FF3333";
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
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        txtUpperDept.text=obj;
        lstOrg_Code.value=obj;
        //datDeptData.Call();
    }
    
}
//----------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
   {
        if(txtFlag_View.text == 'Y')
        {
            ibtnDelete.style.display = "none";
            
        }
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
   }
   else if (obj.id=="datEmployee_Card")
   {
        lblRecord.text=grdEmployee.rows-1 ;
        
   }
   else if (obj.id=="datUser_info")
   {
        ChangeColorItem(lstOrg_Code.GetControl());
        //datGroupData.Call();
   }
   else if (obj.id=="datFind_Report")
   {
		if(txtReportCode_tmp.text =="21" ) //Employee Card.
		{	
			url =System.RootURL + txtReport_tmp.text+'?emp_pk=' + emp_pk_list;                   
		}
        
        window.open(url); 
         
   }    
       
}

//----------------------------------------------------
function ChoseList_box(obj_list,value)
{
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//----------------------------------------------------
function OnSearch(obj)
{
    if (obj==2 && txtEmpID.text=="") 
        alert((v_language =="ENG")?"Please input some employee id":"Bạn hãy nhập mã nhân viên");
    else
    {    
        chkCheckAll.value='F';   
        datEmployee_Card.Call("SELECT");
    }
        
}
//-------------------------------------------------------------
function SelectOption(obj)
{
    if (obj==1)
    {
        txtOption.text="1";
        lstTemp.SetEnable(false);
        txtEmployee.SetEnable(false);
        txtEmpID.SetEnable(true);
        txtEmployee.text="";
        txtEmpID.GetControl().select();
    }
    else if (obj==2)
    {
        txtOption.text="2";
        lstTemp.SetEnable(true);
        txtEmployee.SetEnable(true);
        txtEmpID.SetEnable(false);
        txtEmpID.text="";
        txtEmployee.GetControl().select();
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
//-----------------------------------------------
function OnReport()
{
    
    emp_pk_list="";
                
    for (var i=1;i<=grdEmployee.rows-1;i++)
    {
        if (grdEmployee.GetGridData(i,0)=="-1")
        {
            emp_pk_list = emp_pk_list + grdEmployee.GetGridData(i,9) + ",";
        }   
    }
    if (emp_pk_list=="")
        alert((v_language =="ENG")?"Please choose employees to print":"Bạn hãy chọn nhân viên để báo cáo");
    else
    {
        emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
        
		
        
        if(lstReport.value=="21")
		{
			txtReportCode_tmp.text = lstReport.value;
			txtOrg_tmp_pk.text=lstOrg_Code.value; 
		}
		datFind_Report.Call();
    }
}
//-----------------------------------------------
function OnDelete()
{
    var ctrl = grdEmployee.GetGridControl();
    if (ctrl.SelectedRows >0)
    {
        grdEmployee.DeleteRow();
        datEmployee_Card.Call();
    }
	else
	   alert("Please select employee on the gird before deleting! \n Hãy chọn nhân viên dưới lưới trước khi xóa!");
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

<!------------------------------------->
<gw:data id="datEmployee_Card" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HREM00600_0 " > 
                <input>
                    <input bind="lstOrg_Code" /> 
                    <input bind="lstWorkGroup" /> 
					<input bind="txtEmployee" />
					<input bind="lstContract" />
					<input bind="lstNation" />
                    <input bind="dtFrom_JoinDate" /> 
                    <input bind="dtTo_JoinDate" />
					<input bind="lstStatus" />
                    <input bind="lstHavePicture" />
                </input> 
                <output bind="grdEmployee" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------>
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
   <table id="expand" width="100%" cellpadding="0" cellspacing="0" border=0 style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%" cellpadding="0" cellspacing="0">
						<tr style="width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:textbox id="txtEmployee" onenterkey   ="OnSearch()" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Contract Type
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:list  id="lstContract" value='ALL' maxlen = "100" styles='width:100%' />	
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr style="width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>	
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips"  >
									Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Join Date								
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtFrom_JoinDate" nullaccept styles='width:80%'   lang="<%=Session("Lang")%>"/>
								~
								<gw:datebox id="dtTo_JoinDate" nullaccept styles='width:80%' lang="<%=Session("Lang")%>"/>
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
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								<gw:checkbox id="chkCheckAll" value="F" onclick="doSelectAll()" ></gw:checkbox >		
							</td>
							<td colspan=5 width="5%" >
								Rows:
							</td>
							<td colspan=5 width="5%"> 
								<gw:label id="lblRecord"  text="" maxlen = "100" " />
							</td>
							<td colspan=68 width="68%" style="border:0" align="center" >
							
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(1)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
							</td>
							
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""/> 
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                id="grdEmployee"  
                                header="Print|_Department|Team/Section|Full Name|Emp ID|Card ID|Join Date|Person ID|Position|_PK Emp"   
                                format="3|0|0|0|0|0|0|0|0|0"  
                                aligns="0|0|0|0|1|1|1|1|0|0"  
                                defaults="|||||||||"  
                                editcol="1|0|0|0|0|0|0|0|0|0"  
                                widths="1000|1500|1500|2500|1500|1500|1500|2500|200|0"
                                styles="width:100%; height:100%"   
                                sorting="F" 
                                param="0,1,2,3,4,5,6,7,8,9"  /> 

							</td>
						</tr>
				   </table> 
				</div>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtOption" text="2" styles="display:none"/>   
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />  
<gw:list  id="lstHavePicture" value='ALL' maxlen = "100" styles='width:100%; display:none' />
<gw:list  id="lstWorkGroup" value='ALL' maxlen = "100" styles='width:100%;display:none' />
</html>
