<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var strcodereturn;
var binit=true;
var tab2=false;
var flag2=false;
var startTime,interval_time
var v_language = "<%=Session("SESSION_LANG")%>";
var isick_type=7;



var objgroup;

//"_EMP_PK|Organization|Emp ID|Full Name|_Social No|Date|_Absence Type|Sick Type|Absence Time|_Remark|_Month|From Date|To Date
//|_Abs PK|_Ins From Dt|_Ins To Dt|_PK|_Absence Type|Remark list|Remark|Calculate Flag|Voucher|Status|The Times|Note|_PriorityKind"

var g1_emp_pk = 0;
    g1_org = 1;
    g1_emp_id =2;
    g1_fullname =3;
    g1_social_no =4;
    g1_date = 5;
    g1_absence_type=6;
    g1_sick_type =7;
    g1_absence_time = 8;
    g1_remark =9;
    g1_month= 10;
    g1_from_dt= 11;
    g1_to_dt = 12;
    g1_abs_pk = 13;
    g1_ins_from_dt = 14;
    g1_ins_to_dt = 15;
    g1_pk = 16;
    g1_abs_type = 17;
    g1_remark_lst = 18;
    g1_remark_note = 19; 
    g1_cal_flag = 20;
    g1_voucher = 21;
    g1_status = 22;
    g1_the_times = 23;
    g1_note = 24;
    g1_prioritykind = 25;
	
//tab 2
	//header='Organization|Emp ID|Full Name|_SOCIAL_NO|_HEALTH_NO|Date|Detail Reg Type|Time IN|Time OUT|Work Time|Absence Type|Cal Flag|_reg_detail_pk'
var g2_org=0;
var g2_emp_id=1;
var g2_cal_yn=11;
var g2_reg_detail_pk=12;

function BodyInit()
{
   dtFromDt.SetEnable(false);
   dtToDt.SetEnable(false);
   grdAbsence.GetGridControl().FrozenCols =6;
   grdAbsence.GetGridControl().ScrollTrack=true;
    
   <%=CtlLib.SetGridColumnComboFormat( "grdAbsence" , 7 , "select code,code_fnm from vhr_hr_code where id='HR0055' order by code_nm ") %>;  // sick type
   <%=CtlLib.SetGridColumnComboFormat( "grdAbsence" , 18 , "select code,code_fnm from vhr_hr_code where id='HR0128' order by code ") %>; // remark list
    grdAbsence.SetComboFormat(20,"#Y;Yes|#N;No");
	grdCompare.SetComboFormat(g2_cal_yn,"#Y;Yes|#N;No");
    
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
   user="<%=session("USER_ID")%>";
   menu_id.text=System.Menu.GetMenuID();

   ChangeColorItem(lstOrg_Code.GetControl());
   ChangeColorItem(lstOrg_Code1.GetControl());

   datCheck_View.Call();
   
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
//------------------------------------------------
//function OnChangeDept(deptobj)
//{
//   datOrg_Company.Call();
//}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
}
//----------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screeny+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        txtUpperDept.text=obj;
        datDeptData.Call();
    }
    
}
//-----------------------------------------------
function OnChangeMonth(objMonth)
{
    dtMonth_temp.text=objMonth.value;
    datGetSickPeriod.Call();
}
//-----------------------------------------------
function InitButton(obj)
{
    ibtnSave.SetEnable(obj);
    ibtnDelete.SetEnable(obj);
    ibtnPopup.SetEnable(obj);
}
//-----------------------------------------------
function OnAbsencePopup()
{
    var strcom
    var fpath = System.RootURL + "/form/ch/di/chdi00050_absence.aspx?p_month=" + dtMonth.value + "&p_from_dt=" + dtFromDt.value + "&p_to_dt=" + dtToDt.value + "&p_company_pk="+ txtCompany_PK.text  ;
    var aData=new Array();
	aData = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes') ;
	if ( aData != null )
	{  	 
		var len=aData.length;
		var i;
		for (i=0;i<=len-1;i++)		
		{
                grdAbsence.AddRow();
		        var irow=grdAbsence.rows-1;
		        aRow=aData[i];
		        grdAbsence.SetGridText(irow,0,aRow[0]);		// emp_pk
		        grdAbsence.SetGridText(irow,1,aRow[1]);		// group
		        grdAbsence.SetGridText(irow,2,aRow[2]);		// emp id
		        grdAbsence.SetGridText(irow,3,aRow[3]);		// full name
		        grdAbsence.SetGridText(irow,4,aRow[4]);		// get social no
		        grdAbsence.SetGridText(irow,5,aRow[5]);		// get abs date
		        grdAbsence.SetGridText(irow,6,aRow[6]);		// get absence type
		        if (aRow[14]=="" && lstSick_Type.value!="ALL")
		            grdAbsence.SetGridText(irow,7,lstSick_Type.value);	// get sick type
		        else
		            grdAbsence.SetGridText(irow,7,aRow[14]);	// get sick type
		        grdAbsence.SetGridText(irow,8,8);		// get absence time
		        grdAbsence.SetGridText(irow,21,aRow[9]);		// get voucher == regulation seq
		        grdAbsence.SetGridText(irow,10,dtMonth.value);   // get month
		        grdAbsence.SetGridText(irow,11,aRow[11]);	// get from date
		        grdAbsence.SetGridText(irow,12,aRow[12]);	// get to date
		        grdAbsence.SetGridText(irow,13,aRow[13]);	// get abs_pk
		        grdAbsence.SetGridText(irow,14,dtFromDt.value);	// get from dt
		        grdAbsence.SetGridText(irow,15,dtToDt.value);	// get to dt
		        grdAbsence.SetGridText(irow,17,aRow[15]);	// get  absence code 
		        grdAbsence.SetGridText(irow,18,aRow[16]);	// get  remark list 
		        if (aRow[16] !="01")
		            grdAbsence.SetGridText(irow,19,aRow[17]);	// get  remark
		        grdAbsence.SetGridText(irow,20,"");	//  
		}
	}	
}
//--------------------------
function OnSearch(datobj)
{
    datobj.Call("SELECT");
}
//------------------------------------------------------------------------------------
function OnSetGrid(obj)
{	if(obj=='1')
    {
            var tmp;
            tmp=lstSick_Type.value
            if (tmp!="ALL")
            {
                var ctrl=grdAbsence.GetGridControl();
                if (ctrl.SelectedRows>0)
	            {
	               for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		                {
			                var row = ctrl.SelectedRow(i);
			                if ( row > 0 )
			                {		
				                grdAbsence.SetGridText(row,isick_type,tmp);
				                
			                }
		                }
	            }
	        }
	        else
	            alert("Please select one sick type! \n Hãy chọn loại nghỉ ốm");
	}
	else if(obj=='2')
	{
	 var tmp;
            tmp=lstSick_Type.value
            lstPriorityKind.GetText()
                var ctrl=grdAbsence.GetGridControl();
                if (ctrl.SelectedRows>0)
	            {
	               for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		                {
			                var row = ctrl.SelectedRow(i);
			                if ( row > 0 && (grdAbsence.GetGridData(row,isick_type)!="03"||lstPriorityKind.GetText()==""))
			                {		//alert(lstPriorityKind.GetText());
				                grdAbsence.SetGridText(row,g1_prioritykind,lstPriorityKind.value+"");
				                grdAbsence.SetGridText(row,g1_status,lstPriorityKind.GetText()+"");
			                }
		                }
	            }
	        
	    
	}    
    else if(obj=='3')
    {
        var col_set, value_set;

        if(lstSetBy.value =="1") // status
            col_set = g1_status;
        else if(lstSetBy.value =="2") // the times
            col_set = g1_the_times;
        else if(lstSetBy.value == "3") // Remark note
            col_set = g1_remark_note ;
        else if(lstSetBy.value == "4") // Remark note
            col_set = g1_note ;

            var ctrl=grdAbsence.GetGridControl();
                if (ctrl.SelectedRows>0)
	            {
	               for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		                {
			                var row = ctrl.SelectedRow(i);
				                grdAbsence.SetGridText(row,col_set, txtSet.text);
			                
		                }
	            }
    }
}
//---------------------------
function OnSave()
{
    if (confirm("Do you want to save? \n Bạn có muốn lưu không?"))
    {
        if (CheckData())
            datsickregulation.Call();
    }
}
//---------------------------
function CheckData()
{
    for (var i=1;i<grdAbsence.rows;i++)
    {
        if (grdAbsence.GetGridData(i,isick_type)=="" &&  grdAbsence.GetRowStatus(i) !=64)
        {
            alert("Please select Sick Type at row " +  i + " \n Hãy chọn loại chế độ ốm đau tại dòng " + i  );
            grdAbsence.GetGridControl().IsSelected(i)=true;
            grdAbsence.GetGridControl().TopRow=i
            return 0;
        }
    }
    return 1;
}
function ShowCondition()
{ if(grdAbsence.GetGridData(grdAbsence.row,isick_type)=="03" && grdAbsence.row > 0 )
    { var strcom
      var fpath = System.RootURL + "/form/ch/di/chdi00050_condition.aspx?p_emp_pk="+grdAbsence.GetGridData(grdAbsence.row,0) ;
      var aData=new Array();
      aData = System.OpenModal( fpath , 900 , 600 , 'resizable:yes;status:yes') ;
      if(aData!=null){
      	var len=aData.length;
		if(len > 0)
		{grdAbsence.SetGridText(grdAbsence.row,g1_status,aData[1]);
		 grdAbsence.SetGridText(grdAbsence.row,g1_note,aData[0]);
		}
		}
		
    }
    
}

//-------------------------------------------------
function OnDelete()
{
    if (confirm("Do you want to delete? \n Bạn có muốn xóa không?"))
    {
        grdAbsence.DeleteRow();
        datsickregulation.Call();
    }
}
//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    
    obj=obj_list.GetControl();
	if (obj.options.length ==2)
		{obj_list.SetDataText(value);
		    obj.value= txtUpperDept.text;		
		}
	else
		{obj_list.SetDataText(value);
	    obj.value= txtUpperDept.text;		
		}
       
}
//-------------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
   {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnDelete.style.display = "none";
            ibtnPopup.style.display = "none";
        }
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        {
            datUser_info.Call();     	    
        }
        else
        {
            txtorg_tmp.text=lstOrg_Code.value;
            datOrg_Company.Call();
        }
        
   }
   else if (obj.id=="datDeptData")
   {
         txtDeptData.text=txtDeptData.text+"|ALL|Select All";
        ChoseList_box(lstOrg_Code,txtDeptData.text);
        ChoseList_box(lstOrg_Code1,txtDeptData.text);
       
   }
   else if (obj.id=="datUser_info")
   {
        lstOrg_Code.SetDataText(txtDeptData.text);
        lstOrg_Code1.SetDataText(txtDeptData.text);
       
        ChangeColorItem(lstOrg_Code.GetControl());
        ChangeColorItem(lstOrg_Code1.GetControl());

        //datOrg_Company.Call();
        onChange_org(3,lstOrg_Code);
   }
   else if(obj.id =="datWorkGroup_info")
   {
        if(flag_tab =="1")
        {
		    lstGrp_Code.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstGrp_Code.value="ALL";
        }
        else if(flag_tab =="2")
        {
            lstGrp_Code1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstGrp_Code1.value="ALL";
        }
        else if(flag_tab =="3")
        {
            lstGrp_Code.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstGrp_Code.value="ALL";
            lstGrp_Code1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
		    lstGrp_Code1.value="ALL";
        }
        datOrg_Company.Call();
   }
   else if(obj.id =="datOrg_Company")
   {
        if(tabMain.GetCurrentPageNo()==0)
        {
            OnChangeMonth(dtMonth);
        }
        else OnChangeMonth(dtMonth1);
   }
   else if (obj.id=="datsickregulation")
   {
        lblRecord.text=grdAbsence.rows-1 ;
        
   }
   else if (obj.id=="datregulationcompare")
   {
		lblRecord1.text=grdCompare.rows-1;
   }
   else if (obj.id=="datGetSickPeriod")
    {
        
        if (tabMain.GetCurrentPageNo()==0 || binit==true)
        {
            dtFromDt.value=dtFromDt_temp.text;
            dtToDt.value=dtToDt_temp.text;
        }
        if (tabMain.GetCurrentPageNo()==1 || binit==true)
        {
            dtFromDt1.value=dtFromDt_temp.text;
            dtToDt1.value=dtToDt_temp.text;
        }
        if (binit==true)
            binit=false; 
        switch (String(txtresult.text))
        { 
            case "0":
            {
                lblCloseYN.text='Status: Not Register';
                InitButton(false);
                break;
            }
            
            case "2":
            {
                lblCloseYN.text='Status: Close';
                InitButton(false);
                break;
            }
            default:
            {
                lblCloseYN.text='Status: Open';
                InitButton(true);
                break;
            }
        }
    }
    else if(obj.id=="datPriority")
    {lstPriorityKind.SetDataText(txtPriority.text+"||");
    }
	 else if (obj.id=="datGetDetailRegulation")
    {
        lstSick_Type1.value='ALL';
    }
}

function  OnChangeSickType()
{datPriority.Call();
}
/*#######################################################################################*/
function OnDataError(obj)
{
	AlertDBError(obj.errmsg);
}

/*#######################################################################################*/
function AlertDBError(errmsg)
{
	var aTmp = new Array();
	aTmp = errmsg.split("ORA-");
	if(aTmp.length >= 2)
	{
		alert(aTmp[1]);
	}
	else 
	{
		alert(errmsg);
	}
}

function OnChangeReg()
{
    datGetDetailRegulation.Call();
}
</script>
<body >
<!------------main control---------------------->
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
<!-------------------data control----------------------->
<gw:data id="datGetSickPeriod" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_SICK_GET_FROM_TO" > 
                <input>
                    <input bind="txtCompany_PK" />
                    <input bind="dtMonth_temp" /> 
                </input> 
                <output>
                    <output bind="dtFromDt_temp" />
                    <output bind="dtToDt_temp" />
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!-------------------data control----------------------->

<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_DEPT_DATA_ALL" > 
                <input>
                    <input bind="txtUpperDept" /> 
                </input> 
                <output>
                    <output bind="txtDeptData" />
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
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:data id="datPriority" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_HRIS00500_0" > 
                <input>
                    <input bind="lstSick_Type" /> 
                </input> 
                <output>
                    <output bind="txtPriority" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datGetDetailRegulation" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_HRIS00500_1" > 
                <input>
                    <input bind="lstRegulation_Type" /> 
                </input> 
                <output>
                    <output bind="lstSick_Type1" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datsickregulation" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)"> 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRIS00500_0" parameter="0,2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" procedure="ST_HR_UPD_HRIS00500_0"> 
                <input bind="grdAbsence">
                    <input bind="lstOrg_Code" /> 
                    <input bind="lstGrp_Code" /> 
                    <input bind="txtTemp" /> 
                    <input bind="lstSick_Type" /> 
                    <input bind="dtMonth" /> 
                    <input bind="dtFromDt" />
                    <input bind="dtToDt" />
                </input> 
                <output bind="grdAbsence"/>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datregulationcompare" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)"> 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRIS00500_1" parameter="11,12" procedure="ST_HR_UPD_HRIS00500_1"> 
                <input bind="grdCompare">
                    <input bind="lstOrg_Code1" /> 
                    <input bind="lstGrp_Code1" /> 
                    <input bind="txtTemp1" /> 
                    <input bind="lstSick_Type1" /> 
                    <input bind="dtMonth1" /> 
                    <input bind="dtFromDt1" />
                    <input bind="dtToDt1" />
                    <input bind="lstAbsence_Type1" /> 
					<input bind="lstRegulation_Type" /> 
                </input> 
                <output bind="grdCompare"/>
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"   > 
    <table name="Management" id="management" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						    <table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0;width:100%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp" onenterkey   ="OnSearch(datsickregulation)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Sick Type
									</td>
									<td colspan=17 width="17%" style="border:0"  align="left" >
										<gw:list  id="lstSick_Type" value='ALL' maxlen = "100" styles='width:100%'onchange="OnChangeSickType()" >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0055'")%>|ALL|Select All
											</data>
										</gw:list>	
									</td>
									<td colspan=3 width="3%" style="border:0"  >
										<gw:imgBtn id="idBtnSet"  styles='width:100%' img="set"  text="Set Grid"  onclick="OnSetGrid(1)"/>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstGrp_Code" value='ALL' maxlen = "100" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workGroup_NM FROM Thr_Work_Group WHERE DEL_IF = 0   order by  workGroup_NM")%>|ALL|Select All</data>
										</gw:list>
									</td>
									
									<td colspan=4 width="4%" style="border:0"  >
									
									</td>
									
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(1,lstOrg_Code)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
											</data>
										</gw:list>
									</td>																		
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Priority Kind
									</td>
									<td colspan=17 style="border:0" width="17%"  align="left" >
										<gw:list  id="lstPriorityKind"  maxlen = "100" styles='width:100%'onchange="" >
											<data>
												<%=CtlLib.SetListDataSQL("select tb.le,tb.level_name||'(max:'||to_char(max_day)||' days)'from vhr_hr_code v ,(select 1 as le ,a.num_2 as max_day,a.char_1 as level_name,a.code as code  from vhr_hr_code a where  a.id='HR0055' union all select 2 as le ,a.num_3 as max_day,a.char_2 as level_name,a.code as code  from vhr_hr_code a where  a.id='HR0055' union all select 3 as le ,a.num_4 as max_day,a.char_3 as level_name,a.code as code  from vhr_hr_code a where  a.id='HR0055' union all select 4 as le ,a.num_5 as max_day,a.char_4 as level_name,a.code as code  from vhr_hr_code a where  a.id='HR0055')tb where v.id='HR0055' and v.code=tb.code and tb.max_day is not null order by v.code,tb.le")%>||
											</data>
										</gw:list>
									</td>
									<td colspan=3 width="3%" style="border:0"  >
										<gw:imgBtn id="idBtnSet2"  styles='width:100%' img="set"  text="Set Grid"  onclick="OnSetGrid(2)"/>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Month
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:datebox id="dtMonth" type="month"  onchange="OnChangeMonth(dtMonth)"  lang="<%=Session("Lang")%>"/>
									</td>
									
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Set column
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstSetBy" value="0" styles='width:100%' onchange=""> 
												<data>LIST|0||1|Status|2|The Times|3|Remark|4|Note</data> 
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=27 style="border:0" width="27%"  align="left" >
										<gw:textbox  id="txtSet" text="" styles='width:100%' />
									</td>
									<td colspan=3 width="3%" style="border:0"  >
										<gw:imgBtn id="idBtnSetBy"  styles='width:100%' img="set"  text="Set Grid"  onclick="OnSetGrid(3)"/> 
									</td>
									<td colspan=2 width="2%" style="border:0"  >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFromDt" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToDt" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
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
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:label id="lblRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=60 width="60%" style="border:0"align="center"> 
								<gw:label id="lblCloseYN"  text="" maxlen = "100" styles="color:blue;width:100%;font-weight: bold;font-size:11" />
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								<gw:button img="search" id="ibtnSearch"  text="Search" alt="Search"  onclick="OnSearch(datsickregulation)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="save" id="ibtnSave"  text="Save"  alt="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="delete" id="ibtnDelete" text="Delete"  alt="Delete"  onclick="OnDelete()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="new" id="ibtnPopup"  text="Add New"  alt="Add New"  onclick="OnAbsencePopup()"/>
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:81%">
					<table cellspacing=0 cellpadding=0 style="height:99%" width=100% border=0>
						<tr style="border:1;width:100%;height:100%" valign="top">
							<td colspan=100  style="width:100%;height:100%;"> 
								 <gw:grid   
									id="grdAbsence"  
									header="_EMP_PK|Organization|Emp ID|Full Name|_Social No|Date|_Absence Type|Sick Type|Absence Time|_Remark|_Month|From Date|To Date|_Abs PK|_Ins From Dt|_Ins To Dt|_PK|_Absence Type|Remark list|Remark|Calculate Flag|Voucher|Status|The Times|Note|_PriorityKind"
									format="0|0|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|2|0|2|0|0|0|0|0"  
									aligns="0|0|1|0|0|1|0|2|1|2|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="||||||||||||||||||||0|0||||"  
									editcol="0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1"  
									widths="0|1500|1000|2500|1200|1200|1700|2000|1300|2000|1200|1200|1200|1700|1500|0|0|0|1500|2500|1500|2000|2000|2000|2500|0"  
									styles="width:100%; height:100%" 
									sorting="T" acceptNullDate   
									oncelldblclick     = "ShowCondition()"
									/> 
							</td>
						</tr>
					</table>
				</div>
            </td>
        </tr>
    </table>
    <table name="Compare" id="Table1" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="Table2" style="height:100%" border=0 cellpadding="0" cellspacing="0">
								<tr style="border:0;width:100%;height:4%" valign="center" >									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:textbox id="txtTemp1" onenterkey   ="OnSearch(datregulationcompare)" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstGrp_Code1" value='ALL' maxlen = "100" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT pk,workGroup_NM FROM Thr_work_Group WHERE DEL_IF = 0   order by  workGroup_NM")%>|ALL|Select All</data>
										</gw:list>
									</td>									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Absence Type
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstAbsence_Type1" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0055'")%>|ALL|Select All
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
										<gw:list  id="lstOrg_Code1" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org(2,lstOrg_Code1)" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
											</data>
										</gw:list>
									</td>									
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Reg Type
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstRegulation_Type" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeReg()" >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0054'")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Sick Type
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstSick_Type1" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0055'")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Month
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtMonth1" type="month" onchange="OnChangeMonth(dtMonth1)"  lang="<%=Session("Lang")%>"/>
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFromDt1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToDt1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=2 width="2%" style="border:0"  >
									
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
									
									</td>
									<td colspan=20 width="20%" style="border:0" align="left"> 
										
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
							<td colspan=5 width="5%" style="border:0" align="left"> 
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0"  align="left" >
								<gw:label id="lblRecord1"  text="" maxlen = "100" />
							</td>				
							<td colspan=85 width="85%" style="border:0" align="left">
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="search" id="ibtnSearch1" text="Search"  alt="Search"  onclick="OnSearch(datregulationcompare)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:button img="save" id="ibtnSave2"  text="Save"  alt="Save"  onclick="OnSave()"/>
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:81%">
					<table cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr style="border:1;width:100%;height:85%" valign="top">
							<td colspan=100  style="width:100%;height:100%;"> 
								 <gw:grid id='grdCompare'
									header='Organization|Emp ID|Full Name|_SOCIAL_NO|_HEALTH_NO|Date|Detail Reg Type|Time IN|Time OUT|Work Time|Absence Type|Cal Flag|_reg_detail_pk'
									format='0|0|0|0|0|0|0|0|0|0|0|2|0'
									aligns='0|0|0|0|0|0|0|0|0|0|0|1|1'
									defaults='||||||||||||'
									editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
									widths='1695|1245|3015|1470|1605|1140|1680|1000|1000|1335|1500|1000|1000'
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
</gw:tab>
</body>
<gw:textbox id="txtresult" styles="display:none"/>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="dtFromDt_temp" styles="display:none"/>
<gw:textbox id="dtToDt_temp" styles="display:none"/>
<gw:textbox id="dtMonth_temp" styles="display:none"/>
<gw:textbox id="txtDept" styles="display:none"/>
<gw:textbox id="txtPriority" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>

<gw:textbox id="txtCompany_PK" styles="display:none"/>

<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</html>
