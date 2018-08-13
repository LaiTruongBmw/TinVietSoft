<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var strcodereturn;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var dis_pk="";
//"Select|_EMP_PK|_Department|Organization|Emp ID|Full Name|Kind|Start Date|End Date|Treat Kind|Amount|Reason|Times|Description|_PK"
var stt = 0;   
var G1_select 		=	stt;
var	G1_Emp_PK 		=	++stt;
var	G1_Department 	= 	++stt;
var	G1_Organization =	++stt;
var	G1_Emp_Id		=	++stt;
var	G1_Full_Name 	=	++stt;
var G1_Decide_No	=	++stt;
var G1_Kind 		= 	++stt;
var G1_Start_Dt 	=	++stt;
var G1_End_Dt 		= 	++stt;
var	G1_Treat_code	=	++stt;
var G1_Treat_Kind 	= 	++stt;
var	G1_Amount 		=	++stt;
var	G1_Reason 		= 	++stt;
var G1_Times 		= 	++stt;
var	G1_Description 	=	++stt;
var G1_PK 			= 	++stt;
var check_init = 0;
    
function BodyInit()
{
    txtOrg_tmp_pk.text="<%=Session("COMPANY_PK")%>";
    grdDiscipline.GetGridControl().ScrollTrack=true;
    grdDiscipline.GetGridControl().FrozenCols =5;
	grdDiscipline_his.GetGridControl().ScrollTrack=true;
    grdDiscipline_his.GetGridControl().FrozenCols =5;
    //if (v_language!="ENG")
        System.Translate(document);
    <%=CtlLib.SetGridColumnComboFormat( "grdDiscipline" , 7 ,  "select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0222' order by code_nm") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "grdDiscipline" , 10 ,  "select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0149' order by code_nm") %>;
	<%=CtlLib.SetGridColumnComboFormat( "grdDiscipline_his" , 6 ,  "select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0222' order by code_nm") %>; 
    <%=CtlLib.SetGridColumnComboFormat( "grdDiscipline_his" , 9 ,  "select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0149' order by code_nm") %>;
        	    	   
   ibtnDelete.SetEnable(false);
   ibtnSave.SetEnable(false);
   iduser_pk.text = "<%=session("USER_PK")%>";
   txtHr_level.text= "<%=session("HR_LEVEL")%>";
   user="<%=session("USER_ID")%>";
   menu_id.text=System.Menu.GetMenuID();

   BindingDataList();
   ChangeColorItem(lstOrg_Code.GetControl());
   ChangeColorItem(lstOrg_Code1.GetControl());
   datCheck_View.Call();
   txtlanguage.text = v_language;
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00700', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
	lstOrg_Code1.SetDataText(data);
	lstOrg_Code1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWorkGroup.SetDataText(data);
	lstWorkGroup.value ="ALL";
	lstWorkGroup1.SetDataText(data);
	lstWorkGroup1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="ALL";
	lstNation1.SetDataText(data);
	lstNation1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0222', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
	lstKind.SetDataText(data);
	lstKind.value ="ALL";
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0222', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
	lstKind1.SetDataText(data);
	lstKind1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus1.SetDataText(data);
	lstStatus1.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstContract_type.SetDataText(data);
	lstContract_type.value ="ALL";
	lstContract_type1.SetDataText(data);
	lstContract_type1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST3('HREM00700', '1', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstSelectDate.SetDataText(data);	
	lstSelectDate1.SetDataText(data);

	

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
function OnShowPopup(n)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {	
		if(n==1)
		{
            lstOrg_Code.value=obj;
			//onChange_org(1,lstOrg);
		}	
        else  
		{
            lstOrg_Code1.value=obj;   
			//onChange_org(2,lstOrg1);
		}	
        txtUpperDept.text=obj;
        
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
//----------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
   {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnDelete.style.display = "none";
        }
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
		check_init = 1;
   }
   else if (obj.id=="datDiscipline")
   {
       lblRecord.text=grdDiscipline.rows-1 ;
       if (grdDiscipline.rows>1)
       {
           ibtnDelete.SetEnable(true);
           ibtnSave.SetEnable(true);
       }
       else
       {
           ibtnDelete.SetEnable(false);
           ibtnSave.SetEnable(false);
       }   
   }
   else if (obj.id=="datDiscipline_his")
   {
       lblRecord1.text=grdDiscipline_his.rows-1 ;      
   }
   
   else if (obj.id=="datFind_Report")
   {
		var url = System.RootURL;
		switch (txtReportCode_tmp.text){
			case "22":
			{
				url =url + txtReport_tmp.text + '?p_user=' + user + '&dis_pk=' + dis_pk;
				break;
			}
			case "23":
			{
				var url = url + txtReport_tmp.text + '?p_user=' ;
					url+= user +'&p_select_dt='+lstSelectDate.value+ '&p_from_dt=' + dtFrom_Date.value + '&p_to_dt=' ;
					url+= dtTo_Date.value + '&p_thr_group_pk=' + lstWorkGroup.value + '&p_search_temp=' + txtEmployee.text +  '&p_status=' + lstStatus.value ;
					url+= '&p_tco_dept_pk=' + lstOrg_Code.value + '&p_level=' + lstKind.value ;
					url+= '&p_Nation=' +  lstNation.value +'&p_contract=' + lstContract_type.value+'&p_lang='+v_language;
				break;		
			}
			case "24":
			{
				var url = url + txtReport_tmp.text + '?p_user=' ;
					url+= user +'&p_select_dt='+lstSelectDate1.value+ '&p_from_dt=' + dtFrom_Date1.value + '&p_to_dt='  ;
					url+= dtTo_Date1.value + '&p_thr_group_pk=' + lstWorkGroup1.value + '&p_search_temp=' ;
					url+= txtEmployee1.text +  '&p_status=' + lstStatus1.value ;
					url+= '&p_tco_dept_pk=' + lstOrg_Code1.value + '&p_level=' + lstKind1.value ;
					url+= '&p_Nation=' +  lstNation1.value +'&p_contract=' + lstContract_type1.value+'&p_lang='+v_language;
				break; 
			}
		
		}
		window.open(url);
    }
	else if(obj.id=="datUser_info")
	{
		lstOrg_Code.SetDataText(txtdept_temp.text + "|ALL|Select All");
		lstOrg_Code.value = "ALL";
		ChangeColorItem(lstOrg_Code.GetControl());
		
		lstOrg_Code1.SetDataText(txtdept_temp.text + "|ALL|Select All");
		lstOrg_Code1.value = "ALL";
		ChangeColorItem(lstOrg_Code1.GetControl());
	}
}

//------------------------------------------------
//----------------------------------------------------
function OnSearch()
{
	datDiscipline.Call("SELECT");
}
function OnSearch1()
{
	datDiscipline_his.Call("SELECT");
}
//-------------------------------------------------------------
function OnReport()
{
        if(lstReport.value=="22")
        {   
            dis_pk="";
            for (var i=1;i<=grdDiscipline.rows-1;i++)
            {
                if (grdDiscipline.GetGridData(i,0)!="0")      
                    if (grdDiscipline.GetGridData(i,G1_Times)!="")
                        dis_pk = dis_pk + grdDiscipline.GetGridData(i,G1_PK) + ",";  
            }
            if (dis_pk!="")
            {
				dis_pk = dis_pk.substr(0,dis_pk.length-1);
                txtReportCode_tmp.text = lstReport.value;
				txtOrg_tmp_pk.text=lstOrg_Code.value; 
                
            }
            else
            {
                alert("Please select employees to report! \n Vui lòng chọn nhân viên để in!");
				return;
            }
        }
        else if(lstReport.value=="23")   
        {   
			txtReportCode_tmp.text = lstReport.value;
			txtOrg_tmp_pk.text=lstOrg_Code.value;
        }
	datFind_Report.Call();
    
}
function OnReport1(){
	txtReportCode_tmp.text = "24";
	txtOrg_tmp_pk.text= lstOrg_Code1.value;
	datFind_Report.Call();
}
//-----------------------------------------------
function OnSave()
{
    if (CheckUpdate() && confirm((v_language =="ENG")?"Do you want to save?":"Bạn sẵn sàng lưu dữ liệu"))
       datDiscipline.Call();
}
//-------------------------------------------------
function CheckUpdate()
{
    for (var i=1;i<=grdDiscipline.rows-1;i++)
    {
        if (grdDiscipline.GetRowStatus(i)==16 && grdDiscipline.GetGridData(i,G1_Kind)=="")
            grdDiscipline.SetRowStatus(i,0);
        if (grdDiscipline.GetRowStatus(i)==16)
        {
            if (grdDiscipline.GetGridData(i,G1_Kind)=="")
            {
                alert((v_language =="ENG")?"You have to input disciplined level at row " + i:"You have to input disciplined level at row " + i );
                return false;
            }
//            if (grdDiscipline.GetGridData(i,G1_PK)=="" && grdDiscipline.GetGridData(i,G1_Create)=="0")
//               grdDiscipline.SetGridText(i,G1_Create,"-1");
        }
    }
    return true;
}
//------------------------------------------
function OnDelete()
{
    if(confirm((v_language =="ENG")?"Do you want to delete?":"Bạn sẵn sàng xóa dữ liệu?"))
    {
       grdDiscipline.DeleteRow();
       datDiscipline.Call();
    }
}
function OnAddNew()
{
	var path = System.RootURL + '/standard/forms/hr/em/hrem00701.aspx';
	var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	 
}
//-----------------------------------------
function OnUnDelete()
{
    if (confirm((v_language =="ENG")?"Do you want to undelete?":"Bạn muốn phục hồi dữ liệu?"))
    {
        grdDiscipline.UnDeleteRow();
        ibtnDelete.SetEnable(true);
    }
}
//------------------------------------------
function CheckButton()
{
    var ctrl 	= grdDiscipline.GetGridControl();
    var rownum 	= ctrl.Row;
    var rownums 	= ctrl.Rows;
    
    if(rownum > 0 && rownums>1)
    {
        if(grdDiscipline.GetRowStatus(rownum) >= 64)
        {
            ibtnDelete.SetEnable(false);
            
        }
        else
        {
            ibtnDelete.SetEnable(true);
            
        }
    }
    
/*    if(ctrl.col == G1_Create)
    {
        if(grdDiscipline.GetGridData(ctrl.row,G1_Create)=="-1")
        {
            grdDiscipline.SetGridText(ctrl.row,G1_Date,"");
            grdDiscipline.SetGridText(ctrl.row,G1_Period,"");
            grdDiscipline.SetGridText(ctrl.row,G1_Start_Dt,"");
            grdDiscipline.SetGridText(ctrl.row,G1_End_Dt,"");
            grdDiscipline.SetGridText(ctrl.row,G1_Reason,"");
        }
    }
*/
}
//---------------------------------------------

function OnSetGrid(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}

function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			tblDetail.style.display="none";
			tblDetail.style.height="0%";
			tblMaster.style.height="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show old Discipline";
			
        }
        else
        {
            imgMaster.status = "expand";
            tblDetail.style.display="";
            tblDetail.style.height="30%";
            tblMaster.style.height="70%";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Close old Discipline";
			OnShowOld();
			
        }
  
}
//------------------------------------------
function OnShowOld()
{
    if (imgMaster.status=="expand")
    {
        var irow=grdDiscipline.row;
        if (irow>=1)
        {
            txtEmp_PK.text=grdDiscipline.GetGridData(irow,G1_Emp_PK);
            txtTimes.text = grdDiscipline.GetGridData(irow,G1_Times);
            datDiscipline_old.Call("SELECT");
        }
        
    }
}
function OnPopUp(strtemp)
{
			var col=event.col;
			rowclick= event.row;
			var kind = grdDiscipline.GetGridData(rowclick,G1_Kind);
			if(col== G1_Treat_Kind)
			{				
				var strcom;
//				obj_list_code=objlist;
				var fpath = System.RootURL + "/standard/forms/hr/co/hrco00900.aspx?code=" +  strtemp +'&kind=' + kind ;
				var strid = strtemp;
				
				var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
				if (obj!=null)
				{					
					grdDiscipline.SetGridText(rowclick,G1_Treat_code,obj[1]);
					grdDiscipline.SetGridText(rowclick,G1_Treat_Kind,obj[2]);
				}
			}
}
function OnChangeValue()
{
	var col = event.col;
	rowclick = event.row;
	if(col == G1_Kind)
	{
		grdDiscipline.SetGridText(rowclick,G1_Treat_Kind,"");
		grdDiscipline.SetGridText(rowclick,G1_Treat_code,"");
	}
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
                    <output bind="txtdept_temp" />
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
<!------------------------------------->
<!------------------------------------------>
<gw:data id="datDiscipline" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,7,8,9,10,11,12,13,14,15,16" function="ST_HR_SEL_HREM00700_0" procedure="ST_HR_UPD_HREM00700_0"> 
                <input bind="grdDiscipline" >
                    <input bind="lstOrg_Code" /> 
                    <input bind="lstWorkGroup" />
                    <input bind="lstStatus" />
					<input bind="lstSelectDate" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="txtEmployee" />
                    <input bind="lstKind" />
                    <input bind="lstNation" />
					<input bind="lstContract_type" />
					<input bind="txtlanguage"/>
                </input>
                <output  bind="grdDiscipline" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datDiscipline_his" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HREM00700_2" > 
                <input bind="grdDiscipline_his" >
                    <input bind="lstOrg_Code1" /> 
                    <input bind="lstWorkGroup1" />
                    <input bind="lstStatus1" />
					<input bind="lstSelectDate1" />
                    <input bind="dtFrom_Date1" />
                    <input bind="dtTo_Date1" />
                    <input bind="txtEmployee1" />
                    <input bind="lstKind1" />
					<input bind="lstNation1" />
					<input bind="lstContract_type1" />
                </input>
                <output  bind="grdDiscipline_his" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"  >
<table id="management" name="Managerment" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>                
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%"  cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:textbox id="txtEmployee" onenterkey   ="OnSearch()" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Kind
							</td>
							<td colspan=20 width="20%" style="border:0"   align="left" >
								<gw:list  id="lstKind" value='ALL' maxlen = "100" styles='width:100%'>
									<data>
										<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0222' order by code_nm")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:100%' >
							   <data>
									<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>|ALL|Select All
								</data>
							</gw:list>
							</td>
						</tr>
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show" onclick="OnShowPopup(1)" href="#tips"  >
									Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
									<data>
										<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								<gw:list  id="lstSelectDate" value='2' maxlen = "100" styles='width:80%' onchange="" />
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtFrom_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtTo_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
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
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center">
							<td colspan=2 width="2%" style="border:0"   >
								<gw:checkbox id="chkCheckReport" value="F" onclick="OnSetGrid(chkCheckReport,grdDiscipline,0)" ></gw:checkbox >
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:label id="lblRecord"  text="" maxlen = "100" " />
							</td>
							<td colspan = 45 width="45%"></td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="save" id="ibtnSave"    alt="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button id="btnNew" img="new" alt="Add New" text="Add new" onclick="OnAddNew()" />
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button img="delete" id="ibtnDelete"    alt="Delete"  onclick="OnDelete()"/>
							</td>
							<td colspan=5 width="5%" style="border:0"  >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
							</td>
							
							<td colspan=10 width="10%" style="border:0" >
								<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""/>
							</td>							
						</tr>
					</table>
				</div>
				<div id="tblMaster" style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                        id="grdDiscipline"  
                                        header="Select|_EMP_PK|_Department|Organization|Emp ID|Full Name|Decide No|Kind|Start Date|End Date|_Treat code|Treat Kind|Amount|Reason|Times|Description|_PK"   
                                        format="3|0|0|0|0|0|0|0|4|4|0|0|-0|0|2|0|0"  
                                        aligns="0|0|2|2|1|0|0|0|1|1|0|2|0|0|0|0|0"  
                                        defaults="||||||||||||||||"  
                                        editcol="1|0|0|0|0|0|0|0|1|1|1|0|1|1|1|1|0"  
                                        widths="700|0|1500|1600|1000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000"  
                                        styles="width:100%; height:100%" 
								        acceptNullDate="T"
                                        sorting="T"    oncellclick="CheckButton()" oncelldblclick="OnPopUp('HR0149')"
										onafteredit="OnChangeValue()"
                                        />  

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
								Kind
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:list  id="lstKind1" value='ALL' maxlen = "100" styles='width:100%'>
									<data>
										<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0222' order by code_nm")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0">								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus1" value='ALL' maxlen = "100" styles='width:100%' >
							   <data>
									<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>|ALL|Select All
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
									<data>
										<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								<gw:list  id="lstSelectDate1" value='2' maxlen = "100" styles='width:80%' onchange="" />
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox id="dtFrom_Date1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtTo_Date1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Nation
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstNation1" value='ALL' maxlen = "100" styles='width:100%' >
									<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm" )%>|ALL|Select All</data>
								</gw:list>
							</td>
						</tr>
					</table>
					</fieldset>
				</div>
				<div style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%">
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
								<gw:button img="search" id="ibtnSearch1"   alt="Search"  onclick="OnSearch1(grdDiscipline_his)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport1" alt="Report" img="excel" text="Report" onclick="OnReport1()"/>
							</td>							
						</tr>
					</table>
				</div>
				<div id="tblMaster" style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                        id="grdDiscipline_his"  
                                        header="_EMP_PK|_Department|Organization|Emp ID|Full Name|Decide No|Kind|Start Date|End Date|Treat Kind|Amount|Reason|Times|Description|_PK"   
                                        format="0|0|0|0|0|0|0|4|4|0|-0|0|2|0|0"  
                                        aligns="0|0|2|1|2|0|0|1|1|0|0|0|1|0|0"  
                                        defaults="||||||||||||||"  
                                        editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                        widths="0|0|2000|1500|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000|1500"  
                                        styles="width:100%; height:100%" 
								        acceptNullDate="T"
                                        sorting="T"    oncellclick="CheckButton()"	 
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
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none"/>
<gw:textbox id="txtTimes" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="txtlanguage" style="display:none"/>
<gw:list  id="lstContract_type" value='ALL' maxlen = "100" styles='display:none' >
</gw:list>
<gw:list  id="lstWorkGroup" value='ALL' maxlen = "100" styles='display:none' >
	<data><%=CtlLib.SetListDataSQL("SELECT PK, WORKGROUP_NM FROM THR_WORK_GROUP WHERE DEL_IF = 0")%>|ALL|Select All</data>
</gw:list> 
<gw:list  id="lstContract_type1" value='ALL' maxlen = "100" styles='display:none' >
</gw:list>
<gw:list id="lstNation" value="ALL" maxlen = "100" styles='display:none'>
</gw:list>
<gw:list  id="lstWorkGroup1" value='ALL' maxlen = "100" styles='display:none' >
	<data><%=CtlLib.SetListDataSQL("SELECT PK, WORKGROUP_NM FROM THR_WORK_GROUP WHERE DEL_IF = 0")%>|ALL|Select All</data>
</gw:list> 
</html>
