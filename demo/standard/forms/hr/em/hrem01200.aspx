<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>APPOINTMENT EXECUTE</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var  user_pk   =  "<%=Session("EMPLOYEE_PK")%>"  ;
var  company_pk   =  "<%=Session("COMPANY_PK")%>"  ;
var v_language = "<%=Session("SESSION_LANG")%>";
var dis_pk="";
var flag="";
var pk_list;
var rowclick;
var flag_WG = false;
//"_PK|_THR_EMP_PK|Select|Emp ID|Full Name|Organization|Appointment By|Old Value|New Value
//|Approve|Approve By|Approve Date|Appointment From Date|Appointment To Date|Description"    
var stt = 0;
var G_PK = stt;
var G_EMP_PK = ++stt;
var G_SELECT = ++stt;
var G_EMP_ID = ++stt;
var G_FULL_NAME = ++stt;
var G_ORGANIZATION = ++stt;
var G_DECIDE_NO	   = ++stt;
var G_APPOINTMENT = ++stt;
var G_OLD_VALUE = ++stt;
var G_NEW_VALUE = ++stt;
var G_APPROVE = ++stt;
var G_APPROVE_BY = ++stt;
var G_APPROVE_DATE = ++stt;
var G_APPOINTMENT_F_DT = ++stt;
var G_APPOINTMENT_T_DT = ++stt;
var G_TIMES				= ++stt;
var G_DESCRIPTION = ++stt; 
//"_PK|Select|Emp ID|Full Name|From Organization|From Workgroup|From Position|From Education|From Manager
//|Old Salary|To Organization|To Workgroup|To Position|To Education|To Manager|New Salary|App Date|Approve Date|Description|Times"
var no =0;
var G1_PK = no;
var G1_EMP_PK = ++no;
var G1_EMP_ID = ++no;
var G1_FULL_NAME = ++no;
var G1_ORGANIZATION = ++no;
var G1_DECIDE_NO	= ++no;
var G1_APPOINTMENT = ++no;
var G1_OLD_VALUE = ++no;
var G1_NEW_VALUE = ++no;
var G1_APPROVE = ++no;
var G1_APPROVE_BY = ++no;
var G1_APPROVE_DATE = ++no;
var G1_APPOINTMENT_F_DT = ++no;
var G1_APPOINTMENT_T_DT = ++no;
var G1_TIMES				= ++no;
var G1_DESCRIPTION = ++no;
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    menu_id.text=System.Menu.GetMenuID();
    var  t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0221' order by code_nm")%>";
       grdApp.SetComboFormat(G_APPOINTMENT,t1); //position
		grdApp_his.SetComboFormat(G1_APPOINTMENT,t1);
	  
	   BindingDataList();
	   ChangeColorItem(lstOrg.GetControl());
	   ChangeColorItem(lstOrg_Code1.GetControl());
       datCheck_View.Call();
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM01200', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM01200', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport1.SetDataText(data);
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0221', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstChange.SetDataText(data);
    lstChange.value ="ALL";
	lstKind1.SetDataText(data);
	lstKind1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	lstOrg_Code1.SetDataText(data);
	lstOrg_Code1.value ="ALL";
			
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus1.SetDataText(data);
	lstStatus1.value ="A";
}
//---------------------------------------------------------------------  

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

 //------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------
function OnSearch()
{
           //add wgroup to grid    
           var arr = txt_WG_temp1.text.replace("DATA|",'').split("|");
           var s="";
           var t=0;
	           for(var i=0;i< (arr.length+1)/2-1;i++)
	            {
		            s = s +"#" + arr[t] + ";" + arr[t+1]+"|";
		            t=t+2;
		        }

    datAppointment.Call("SELECT");
}
function OnSearch1()
{
	datAppointment_his.Call("SELECT");
}
//--------------------------------------------------------------------------------------------------
function OnDelete()
{
    if(confirm("Delete it?\nBạn muốn xóa?"))
    {
		grdApp.DeleteRow();
		datAppointment.Call();
    }
	
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "datCheck_View":
        {
            if(txtFlag_View.text == 'Y')
            {
                btnAdd.style.display = "none";
                btnSave.style.display = "none";
                btnDelete.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }   
	        else 
                datSal_security.Call();     
            
        }
        break;
        case "datAppointment":
        {               
            idRecord.text=grdApp.rows-1 ;
			if(grdApp.rows > 1)
			{
				for (var i = 1; i < grdApp.rows; i++) 
				{
					grdApp.SetCellBgColor(i,G_OLD_VALUE,i,G_OLD_VALUE,0x99FFCC);
					grdApp.SetCellBgColor(i,G_NEW_VALUE,i,G_NEW_VALUE,0xc0cbff);
				}
			}
		}
        break;
        case "datGet_Org":
        {
            grdApp.SetGridText(rowclick,c_To_Org,txtOrgNM.text);
        }
        break;
        case "datUser_info":
        {
            lstOrg.SetDataText(txtdept_temp.text + "|ALL|Select All");
			lstOrg.value = "ALL";
			lstOrg_Code1.SetDataText(txtdept_temp.text + "ALL|Select All");
			lstOrg_Code1.value = "ALL";
			
            ChangeColorItem(lstOrg.GetControl());
			ChangeColorItem(lstOrg_Code1.GetControl());
            datSal_security.Call(); 
         }   
          break;
        case "datSal_security":
           if(txt_sal_security.text=='N') 
           {
				grdApp.GetGridControl().ColHidden(c_Old_Salary)=1;
				grdApp.GetGridControl().ColHidden(c_New_Salary)=1;                    
           }
           txtOrgPK.text=lstOrg.value;
           datWorkGroup_info.Call();  
        break;
        case  "datFind_Report":
          {
            if(txtReportCode_tmp.text =="32")
            {
                var url =System.RootURL + txtReport_tmp.text + '?pk_list=' + pk_list;
            }
            else if(txtReportCode_tmp.text == "33")
            {
                var url =System.RootURL +  txtReport_tmp.text + '?l_sal=' + txt_sal_security.text +'&l_org=' + lstOrg.value  ;
                    url = url +'&l_emp_status=' +lstStatus.value  ;
                    url = url + '&l_search_temp=' + txtEmployee.text+'&l_from_app='+dtFrom.value+'&l_to_app='+dtTo.value;
					url = url + '&l_change='+lstChange.value + '&l_lang=' + v_language;
            }
            else if(txtReportCode_tmp.text == "34")
            {
                var url =System.RootURL +  txtReport_tmp.text + '?l_sal=' + txt_sal_security.text +'&l_org=' + lstOrg_Code1.value  ;
                    url = url+ '&l_emp_status='+lstStatus1.value  ;
                    url = url + '&l_search_temp='+txtEmployee1.text+'&l_from_app='+dtFrom_Date1.value+'&l_to_app='+dtTo_Date1.value+'&l_change='+lstKind1.value ;
					url = url + '&l_lang=' + v_language;
			}
            window.open(url);
		}
        break;
		case"datAppointment_his":
		{
			lblRecord1.text=grdApp_his.rows-1 ;
			if(grdApp_his.rows > 1)
			{
				for (var i = 1; i < grdApp_his.rows; i++) 
				{
					grdApp_his.SetCellBgColor(i,G1_OLD_VALUE,i,G1_OLD_VALUE,0x99FFCC);
					grdApp_his.SetCellBgColor(i,G1_NEW_VALUE,i,G1_NEW_VALUE,0xc0cbff);
				}
			}
		}
		break;
    }
    
}
//---------------------------------------------------------
function OnShowPopup(obj1)
{
    var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			obj1.value = obj;
            
        }
}
//----------------------------------------------------
function OnAdd()
{
    //add wgroup to grid             
    var path = System.RootURL + '/standard/forms/hr/em/hrem01201.aspx';
	var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	

}
//------------------------------------------------------------------------
function Popup()
{
    var col=event.col;
    if(col==c_To_Org)
    {
        
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/em/hrem01202.aspx?";
        var obj  = System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');
        //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            rowclick= event.row;
             txtOrgPK.text = obj;
			 grdApp.SetGridText(event.row,c_TO_ORG_PK,txtOrgPK.text);
           
            datGet_Org.Call();

        }    
    }
}
//-------------------------------------------------------
function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			tblDetail.style.display="none";
			tblDetail.style.height="0%";
			tblMaster.style.height="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show old Appointment";
			
        }
        else
        {
            imgMaster.status = "expand";
            tblDetail.style.display="";
            tblDetail.style.height="30%";
            tblMaster.style.height="70%";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Close old Appointment";
			OnShowOld();
			
        }
  
}
//------------------------------------------
//-------------------------------------------------------------
function OnReport()
{
        if(lstReport.value == "32") //Appointment Form
        {   
            pk_list="";
            for (var i=1;i<=grdApp.rows-1;i++)
            {
                if (grdApp.GetGridData(i,G_SELECT)!="0")    
                        pk_list = pk_list + grdApp.GetGridData(i,G_PK) + ",";  
            }          
            if (pk_list!="")
            {   
                txtReportCode_tmp.text = lstReport.value;
				txtOrg_tmp_pk.text=lstOrg.value;
                
            }
            else
            {
                alert("Please select employees to report! \n Vui lòng chọn nhân viên để in!");
				return;
            }
        }
        else if(lstReport.value == "33") //Summary
        {
			txtReportCode_tmp.text = lstReport.value;
			txtOrg_tmp_pk.text=lstOrg.value;
        }
        else if(lstReport.value == "34") //Detail
        {
            txtReportCode_tmp.text = lstReport1.value;
			txtOrg_tmp_pk.text=lstOrg_Code1.value;
        }

    datFind_Report.Call();
}
function OnReport1()
{
	if(lstReport1.value == "34") //Detail
        {
            txtReportCode_tmp.text = lstReport1.value;
			txtOrg_tmp_pk.text=lstOrg_Code1.value;
        }
	datFind_Report.Call();
}
function OnSetGrid()
{
    if(lstSetBy.value =="" )
    {
        alert("Please choose value to set\nBạn phải chọn giá trị để set.");
        return;
    }
    else 
    {
        var ctrl=grdApp.GetGridControl();
        for(var i=1;i<=ctrl.SelectedRows;i++)
        {
            if(lstSetBy.value == "1") //Organization
            {   
                if(lstOrg_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_TO_ORG_PK ,lstOrg_Set.value );
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_To_Org ,lstOrg_Set.GetText() );
            }
            else if(lstSetBy.value =="2") //Work Group
            {
                if(lstGrp_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_To_WG ,lstGrp_Set.value );
            }
            else if(lstSetBy.value =="3") //Position
            {
                if(lstPos_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_To_Position ,lstPos_Set.value );
            }
            else if(lstSetBy.value =="4") //Education
            {
                if(lstEdu_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_To_Education ,lstEdu_Set.value );
            }
            else if(lstSetBy.value =="5") //App Date
            {
                if(dt_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_App_Date ,dt_Set.value );
            }
            else if(lstSetBy.value =="6") //Approve Date
            {
                if(dt_Set.value =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_Approve_DT ,dt_Set.value );
            }
            else if(lstSetBy.value =="7") //Reason
            {
                if(txtValue.text =="" )
                {
                    alert("Please choose value to set\nBạn phải chọn giá trị để set.");
                    return;
                }
                grdApp.SetGridText(ctrl.SelectedRow(i-1),c_Description ,txtValue.text );
            }
            
        }
        
    }
}


</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-- Kiem tra quyen xem luong ---------------------------------------->
    <gw:data id="datSal_security" onreceive="OnDataReceive(this)"  > 
            <xml>
                <dso  type="process" procedure="ST_HR_PRO_CO_SAL_DISPLAY"  > 
                    <input>
                        <input bind="iduser_pk" />
                    </input> 
                    <output>
                        <output bind="txt_sal_security" />
                    </output>
                </dso> 
            </xml> 
    </gw:data>
<!------------------------------------->
<gw:data id="datGet_Org" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_ORG_NM" > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtOrgNM" />
                </output>
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
<!------------------------------------------>
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txt_WG_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------------------------------------------------->
<gw:data id="datAppointment" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HREM01200_0" procedure="ST_HR_UPD_HREM01200_0" parameter="0,1" > 
                <input bind="grdApp">
                    <input bind="lstOrg" /> 
                    <input bind="txtEmployee" />
                    <input bind="lstStatus" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="lstChange" />
                </input> 
                <output bind="grdApp"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datAppointment_his" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HREM01200_1" procedure="ST_HR_UPD_HREM01200_1" parameter="0,1" > 
                <input bind="grdApp_his">
                    <input bind="lstOrg_Code1" /> 
                    <input bind="txtEmployee1" />
                    <input bind="lstStatus1" />
                    <input bind="dtFrom_Date1" />
                    <input bind="dtTo_Date1" />
                    <input bind="lstKind1" />
                </input> 
                <output bind="grdApp_his"/>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>


<!--------------------------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"  >
    <table  id="tblEvent" name="Managerment" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>              
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%"  cellpadding="0" cellspacing="0">
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtEmployee" onenterkey   ="OnSearch()" styles='width:100%'/>
									</td>						
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Appointment Type
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstChange" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >								
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(lstOrg)" href="#tips"  >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%'onchange="" />
									</td>
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Appointment Date
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtFrom" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 style="border:0" width="10%" align="left" >
										
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">																	
									</td>														
								</tr>
							</table>
						</fieldset>
				</div>
				<div style="border-top:0 solid #62ac0d;border-left:0 solid #62ac0d;border-right:0 solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="10%" style="border:0" align="" >
								Rows: 
							</td>							
							<td colspan=5 width="5%" style="border:0" align="" >
								<gw:label id="idRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=45 width="45%" style="border:0" align="" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="" >
								<gw:button img="search" id="ibtnSearch3"  text="Search"  alt="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="" >
								<gw:button id="btnDelete" img="delete" text = "Delete" alt="Delete" onclick="OnDelete()" />
							</td>
							<td colspan=7 width="7%" style="border:0" align="" >
								<gw:button id="btnAdd" img="new" text= "Add New" alt="Add" onclick="OnAdd()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
							</td>							
							<td colspan=10 width="10%" style="border:0" align="" >
								<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""/> 
							</td>														
						</tr>
					</table>
				</div>
				<div id="tblMaster" style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:99%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                        id="grdApp"  
                                        header="_PK|_THR_EMP_PK|Select|Emp ID|Full Name|Organization|Decide No|Appointment Type|Old Value|New Value|Approve By|Approve Date|Apply From Date|Apply To Date|Times|Description"
                                        format='0|0|3|0|0|0|0|0|-0|-0|0|0|4|4|0|0' 
                                        aligns='0|1|0|0|0|0|0|0|0|0|0|0|1|1|1|0'
                                        defaults='||||||||||||||||' 
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                        widths='0|0|800|1000|2000|1500|1500|1500|1500|1500|2000|1500|1500|1500|500|2000'
                                        sorting='T' 
                                        styles='width:100%; height:100%' 
                                        acceptnulldate='T' />

							</td>
						</tr>
				   </table> 
				</div>
            </td>
        </tr>
    </table>
	<table name="History" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
		<tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%"  cellpadding="0" cellspacing="0">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="txtEmployee1" onenterkey   ="OnSearch1(datDiscipline_his)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Appointment Type
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstKind1" value='ALL' maxlen = "100" styles='width:100%'>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0">								
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus1" value='A' maxlen = "100" styles='width:100%' >
									   <data>
											
										</data>
									</gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show" onclick="OnShowPopup(2)" href="#tips"  >
											Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg_Code1" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Appointment Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFrom_Date1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtTo_Date1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >									
									</td>
									<td colspan=20 width="20%" style="border:0"> 									
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center">
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:label id="lblRecord1"  text="" maxlen = "100" " />
							</td>
							<td colspan = 75 width="75%"></td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch1"   alt="Search"  onclick="OnSearch1(grdApp_his)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport1" alt="Report" img="excel" text="Report" onclick="OnReport1()"/>
							</td>							
						</tr>
					</table>
				</div>
				<div id="tblMaster" style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                        id="grdApp_his"  
                                        header="_PK|_THR_EMP_PK|Emp ID|Full Name|Organization|Decide No|Appointment Type|Old Value|New Value|Approve By|Approve Date|Apply From Date|Apply To Date|Times|Description"
                                        format='0|0|0|0|0|0|0|-0|-0|0|0|4|4|0|0' 
                                        aligns='0|1|0|0|0|0|0|0|0|0|1|1|1|0|0'
                                        defaults='|||||||||||||||' 
                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                                        widths='0|0|1000|2000|1500|1500|1500|1500|1500|2000|1500|1500|1500|500|2000'
                                        sorting='T' 
                                        styles='width:100%; height:100%' 
                                        oncellclick=""
                                        acceptnulldate='T' />  

							</td>
						</tr>
				   </table> 
				</div>
			</td>
		</tr>
	</table>
</gw:tab>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display:none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display:none" />
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txt_sal_security" styles="display:none"/>
    <gw:textbox id="txtOrgPK" styles="display:none"/>
    <gw:textbox id="txtOrgNM" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="txtTimes" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
	<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtidmenu" text="139" styles="display:none"/>
    <gw:textbox id="txtflag_menu" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  /> 
    <gw:textbox id="txt_WG_temp1" styles="display:none"/>
	<gw:textbox id="txt_WG_temp" styles="display:none"/>
	<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
	<gw:list  id="lstReport1" styles="color:blue;width:100%;display:none" onchange=""/>
    <!------------------------------------------->
</body>
</html>
