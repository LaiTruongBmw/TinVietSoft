<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time
var dt_tmp
var opt_value=1
var arr_col    =new Array();
var emp_pk_list;
var select = 'N';

var g_kind =6;

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    idGrid.GetGridControl().FrozenCols =6;
    //if (v_language!="ENG")
        System.Translate(document);	
     <%=CtlLib.SetGridColumnComboFormatString2( "idGrid" , 26 , "Y|YES|N|NO") %>;
     //SetGrid_KindList(lst_Ins_kind);

     var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0041' order by code_nm")%>";
       idGrid.SetComboFormat(g_kind,t1);
       data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRIS00300', 1) FROM DUAL")%>";
       lstReport.SetDataText(data);
      iduser_pk.text = "<%=session("USER_PK")%>";
      txtHr_level.text= "<%=session("HR_LEVEL")%>";
      menu_id.text=System.Menu.GetMenuID();
      ChangeColorItem(lstOrg.GetControl());

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

//---------------------------------------------------
function OnShowPopup()
{
        var fpath = System.RootURL + "/form/ch/ae/chae00010_dept.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:200;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
             txtUpperDept.text=obj;
             datDeptData.Call();
        }
}
//------------------------------------------------------------------------------------
function OnChangeDept()
{
    //txtDept.text=lstOrg.value;
    datTeamData.Call();
}
//------------------------------------------------------------------------------------
function Set_Enable(n)
{
    ibtnAdd.SetEnable(n);
    ibtnDel.SetEnable(n);
    ibtnSave.SetEnable(n);    
}
function SetGrid_KindList(obj)
{
    idGrid.ClearData();
    var s="";
    var lst=obj.GetControl();
    
    for(var i=0;i<lst.length-1;i++)
    {
        s+="#"+lst.item(i).value+";"+lst.item(i).text+"|";
    }
    s=s.substring(0,s.length-1);
    idGrid.SetComboFormat(6,s);
}
function OnDataReceive(obj)
{
        if(obj.id == "datCheck_View")
        {
            if(txtFlag_View.text == 'Y')
            {
                ibtnAdd.style.display = "none";
                ibtnDel.style.display = "none";
                ibtnSave.style.display = "none";
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                datUser_info.Call(); 
            else
                datGetInformation.Call();      
           
        }
        else if (obj.id=="datGet_List_Kind")
        {
               //SetGrid_KindList(lst_Ins_kind)
               datGetInformation.Call();
            
        }
       
       else if (obj.id=="datGetInformation")
       {
             if(txtMonth_flag.text=="C")
                Set_Enable(0);
             else   
                Set_Enable(1);
            idEmployees.text = txtEmployee.text;
            idAmount.text = txtAmount.text;

            datWorkGroup_info.Call();
       }
       else if(obj.id == "datWorkGroup_info")
       {
            lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
            lstWG.value ="ALL";
       }
       else if (obj.id=="datDeptData")
       {
            if(txtHr_level.text=="6")
                txtDeptData.text=txtDeptData.text+"|ALL|Select All";
            lstOrg.SetDataText(txtDeptData.text)    ;
            
              obj=lstOrg.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=0;
            datTeamData.Call();
       }
       else if (obj.id=="datTeamData")
       {
            datOrg_Company.Call();
			//datGetInformation.Call(); 
       }
       else if (obj.id=="datUser_info")
       {
            ChangeColorItem(lstOrg.GetControl());
            datTeamData.Call();
       }
       else if (obj.id=="datIns_management")
       {
            idRecord.text=idGrid.rows-1;
            if(idGrid.rows-1>0)
                SetColRow();
            auto_resize_column(idGrid,0,idGrid.cols-1,0);
            datGetInformation.Call(); 
       }
       else if (obj.id=="datFind_Report")
       {
            var url;
            switch(idReport.value)
            {
                case "1": //1a-TBH report
                    url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?l_rpt_month=' + idWorkMon.value + '&l_times=' + lst_times.value + '&company_pk='+ txtCompany_PK.text;
                    window.open(url);
                    break;
//                case "2": //02a-TBH report
//                    url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?l_rpt_month=' + idWorkMon.value + '&l_times=' + lst_times.value;
//                    window.open(url);
//                    break;
				case "2": //03a-TBH report
                    select = 'N';
                    for(var i=1; i< idGrid.rows; i++)
                    {
                        if(idGrid.GetGridData(i, 1)== "-1")
                        {
                            select = 'Y';
                            i= idGrid.rows;
                        }       
                    }
                    if(select=="Y")
                        datDel_Report.Call();
                    else
                    { 
                        url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?emp_pk='+ emp_pk_list + '&l_rpt_month=' + idWorkMon.value + '&l_times=' + lst_times.value +'&l_select=' + select + '&company_pk='+ txtCompany_PK.text + '&l_nation='+ lstNation.value;
                        window.open(url);
                    }
                    break;
			    case "3": //03a-TBH report
                    select = 'N';
                    for(var i=1; i< idGrid.rows; i++)
                    {
                        if(idGrid.GetGridData(i, 1)== "-1")
                        {
                            select = 'Y';
                            i= idGrid.rows;
                        }       
                    }
                    if(select=="Y")
                        datDel_Report.Call();
                    else
                    { 
                        url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?emp_pk='+ emp_pk_list + '&l_rpt_month=' + idWorkMon.value + '&l_times=' + lst_times.value +'&l_select=' + select + '&company_pk='+ txtCompany_PK.text+ '&l_nation='+ lstNation.value;
                        window.open(url);
                    }
                    break;
             }       
                

       }
       else if(obj.id == "datDel_Report")
       {
            datReport.Call();
       }
	   else if(obj.id == "datReport")
       {
            var url;
            idRecord.text=idGrid.rows-1;
            if(idGrid.rows-1>0)
                SetColRow();
            auto_resize_column(idGrid,0,idGrid.cols-1,0);

            url =System.RootURL + '/reports/ch/di/'+txtReport_tmp.text+'?l_rpt_month=' + idWorkMon.value + '&l_times=' + lst_times.value +'&l_select=' + select + '&company_pk='+ txtCompany_PK.text;
            window.open(url);
       }
       else if(obj.id == "datOrg_Company")
       {
            datGet_List_Kind.Call(); 
       }
}     
function SetColRow()
{
    for(var i=1;i< idGrid.rows ;i++)
    {
        if(idGrid.GetGridData(i,31)!="")
            idGrid.SetCellBgColor(i,1,i,31,0xBAEDD3);
        else 
        {
            idGrid.SetCellBgColor(i,6,i ,8,0xFFEEFF);
            idGrid.SetCellBgColor(i,15,i ,18,0xFFEEFF);
            idGrid.SetCellBgColor(i,25,i ,26,0xFFEEFF);
            idGrid.SetCellBgColor(i,31,i ,26,0xFFEEFF);
        }
        
    }
}
//------------------------------------------------------------------------------------
function OnSearch()
{
  datIns_management.Call("SELECT");  
}
//------------------------------------------------------------------------------------
function OnUpdate()
{
    
    if(confirm("Do you want to save?\nBạn đã chắc chắn save?"))
        datIns_management.Call();
}
//------------------------------------------------------------------------------------
function onchange_time()
{
    datGet_List_Kind.Call();
}
function onchange_month()
{
    datGetInformation.Call();
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
/*
function on_click_grid()
{
    arr_col[event.col]=idGrid.GetGridData(event.row,event.col);
    
}*/
function onCheck_edit()
{
    var tmp;
    if(idGrid.rows<=1)
        return;
    if(event.col==7||event.col==8||event.col==18||event.col==17)//nhung cot nay phai la so
    {
        if(isNaN(idGrid.GetGridData(event.row,event.col)))  
        {      
            alert("This column must be a number.\nThông tin cột này phải là số.");
            idGrid.SetGridText(event.row,event.col,"");
        }
    }
    if(event.col==15||event.col==16)//nhung cot nay phai theo kieu mm/yyyy
    {
        tmp=idGrid.GetGridData(event.row,event.col);
        if(Trim(tmp)=="")
            return;
        if(tmp.length!=7||tmp.substring(2,3)!='/'||isNaN(tmp.substring(0,2))||isNaN(tmp.substring(3,7)))
        {
            alert("Incorrect type or month. (mm/yyyy)\nBạn nhập kiểu tháng không đúng.(mm/yyyy)");
            idGrid.SetGridText(event.row,event.col,"");
        }    
    }
}
function Add_new()
{
    var fpath = System.RootURL + "/form/ch/di/chdi00030_search_emp.aspx?p_work_mon="+idWorkMon.value ;
    var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
	if (obj!=null)
	{
	   /* alert(obj[0]);
	    alert(obj[1]);
	    alert(obj[2]);
	    alert(obj[5]);*/
	    idGrid.AddRow();
	    idGrid.SetGridText(idGrid.rows-1,0,obj[0]);//emp_pk
	    idGrid.SetGridText(idGrid.rows-1,2,obj[6]);//group_nm
	    idGrid.SetGridText(idGrid.rows-1,3,obj[1]);//emp id
	    idGrid.SetGridText(idGrid.rows-1,4,obj[2]);//full name
	    idGrid.SetGridText(idGrid.rows-1,5,obj[5]);//social no
	    idGrid.SetGridText(idGrid.rows-1,7,obj[29]);//social no
	    idGrid.SetGridText(idGrid.rows-1,8,obj[30]);//social no
	    if(lst_Ins_kind.value!="ALL")
	        idGrid.SetGridText(idGrid.rows-1,6,lst_Ins_kind.value);
	    idGrid.SetGridText(idGrid.rows-1,27,idWorkMon.value);
	    idGrid.SetGridText(idGrid.rows-1,28,lst_times.value);
	    
	}
}
function Delete_row()
{
     if(confirm("Do you want to delete?\nBạn đã chắc chắn delete?"))
        idGrid.DeleteRow();
}
function UnDelete_row()
{
    idGrid.UnDeleteRow();
}
//--------------------------------
function OnPrint()
{
    txtOrg_tmp_pk.text=lstOrg.value;
    switch(idReport.value)
    {
         
        case "1": //02a-TBH Report
        {
            txtReport_tmp.text="rpt_01a_TBH.aspx";
            datFind_Report.Call();
            break;        
        } 
        case "2": //03a-TBH Report
        {
            txtReport_tmp.text="rpt_D02_TS.aspx";
            datFind_Report.Call();
            break;        
        }  
        case "3": //03a-TBH Report
        {
            txtReport_tmp.text="rpt_D02_TS_BD.aspx";
            datFind_Report.Call();
            break;        
        }  
//		case "3": //02a-TBH Report
//        {
//			emp_pk_list="";
//                    
//                    for (var i=1;i<=idGrid.rows-1;i++)
//                    {
//                        if (idGrid.GetGridData(i,1)=="-1")
//                        {
//                            emp_pk_list = emp_pk_list + idGrid.GetGridData(i,0) + ",";                        
//                        }   
//                    }
////                    if (emp_pk_list=="")
////					{
////                        alert("Please choose employees to print");
////						return;
////					}	
////                    else
////                    {
//                        emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
//                        txtReport_tmp.text="rpt_03a_TBH.aspx";

////                    }
//                    datFind_Report.Call();

//            break;        
//        }
            
    }
    
    
}
function OnShowPopup(n)
{
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:30;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
            lstOrg.value=obj;
        
    }    
}
//------------------------------------------------------------------------------------
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
function OnSetDate()
{
    
    var check= false;      
    if(confirm("Do you want to set report date?"))
    {          
        for (var i=1;i<=idGrid.rows-1;i++)
        {
            if (idGrid.GetGridData(i,1)=="-1")
            {
                idGrid.SetGridText(i, 31, idSetDate.value); // Set Report Date                     
                check = true;
            }   
        }
        if(!check)
        {
            alert("Please choose employee to set report date.\nBạn phải chọn nhân viên để set ngày báo cáo.");
            return;
        }
    }
}
function OnChange_Date()
{
    if(lstReportYN.value =="N")
    {
        alert("You can't search date because status of Report YN is No.\nKhông thể tìm kiếm theo ngày báo cáo khi tình trạng báo cáo là No.");
        dtFromReport.value ="";
        dtToReport.value ="";
    }
}
function OnChangeReport()
{
    if(lstReportYN.value == "N")
    {
        dtFromReport.value ="";
        dtToReport.value ="";
    }
}
function OnChangeForm()
{
    if(lstForm.value == "1" || lstForm.value == "ALL")
        idReport.value = "1";
    else if(lstForm.value == "2")
        idReport.value = "2";
    else if(lstForm.value == "3")
        idReport.value = "3";
}
</script>

<body>
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
<gw:data id="datTeamData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_TEAM_DATA_ALL" > 
                <input>
                    <input bind="lstOrg" /> 
                </input> 
                <output>
                    <output bind="txtGroupData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datGet_List_Kind" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_PRO_CO_LIST_INS_KIND" > 
                <input>
                    <input bind="txtCompany_PK" />
                    <input bind="lst_times" />
                </input> 
                <output>
                    <output bind="lst_Ins_kind" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGetInformation" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_INS_INFO" > 
                <input>
                    <input bind="txtCompany_PK" /> 
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" />
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
					<input bind="lstNation" />
                </input> 
                <output>
                    <output bind="txtEmployee" />
                    <output bind="txtAmount" />
                    <output bind="txtMonth_flag" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_FIND_REPORT_2" > 
                <input>
                    <input bind="txtReport_tmp" />
                    <input bind="txtOrg_tmp_pk" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datIns_management" onreceive="OnDataReceive(this)" > 
        <xml> 
           
            <dso  type="grid"  parameter="0,5,6,7,8,15,16,17,18,25,26,27,28,29,30,31" function="ST_HR_SEL_HRIS00300_0" procedure="ST_HR_UPD_HRIS00300_0"> 
                <input bind="idGrid" >
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" />
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="idtxtTmp" />
					<input bind="lstNation" />
                    <input bind="dtFromReport" />
                    <input bind="dtToReport" />
                    <input bind="lstReportYN" />
                    <input bind="lstForm" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datReport" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,29" function="ST_HR_SEL_HRIS00300_1" procedure="ST_HR_UPD_HRIS00300_1"> 
                <input bind="idGrid" >
                    <input bind="idWorkMon" /> 
                    <input bind="lst_times" /> 
                    <input bind="lst_Ins_kind" />
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="idtxtTmp" />
					<input bind="lstNation" />
                    <input bind="dtFromReport" />
                    <input bind="dtToReport" />
                    <input bind="lstReportYN" />
                    <input bind="lstForm" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
<gw:data id="datDel_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00300_0" > 
                <input>
                    <input bind="txtTmpInput" /> 
                </input> 
                <output>
                    <output bind="txtTmpOutput" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-----------------Get ID company theo Organization ------------------------>
<gw:data id="datOrg_Company" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRIS00300_1" > 
                <input>
                    <input bind="lstOrg" /> 
                </input> 
                <output>
                    <output bind="txtCompany_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------Get Workgroup theo ORGANIZATION---------------------->
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="lstOrg" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr style="width:100%;height:100%" valign="top">
		<td>                
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >			
							<tr style="border:0;width:100%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Employee
								</td>
								<td colspan=15 width="15%" style="border:0"> 
									<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
								</td>								
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Group
								</td>
								<td colspan=15 style="border:0" width="15%"  align="left" >
									<gw:list  id="lstWG"  value="ALL" styles='width:100%' >
										<data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Month
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:datebox id="idWorkMon" lang="<%=Session("Lang")%>"  onchange="onchange_month()" type=month ></gw:datebox>
								</td>							
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Report DT
								</td>
								<td colspan=7 width="7%" style="border:0" align="left"> 
									<gw:datebox id="dtFromReport" lang="<%=Session("Lang")%>" nullaccept onchange="OnChange_Date()" type=date></gw:datebox> 
								</td>
								<td colspan=8 width="8%" style="border:0" align="left"> 
									<gw:datebox id="dtToReport" lang="<%=Session("Lang")%>" nullaccept onchange="OnChange_Date()" type=date></gw:datebox>
								</td>
							</tr>
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstOrg" styles='width:100%' onchange="OnChangeDept()" >
										<data>
											<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
										</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Times
								</td>
								<td colspan=15 style="border:0" width="15%"  align="left" >
									<gw:list  id="lst_times" onchange="onchange_time()" maxlen = "100" styles='width:100%' >
												<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0042' ORDER BY B.CODE")%></data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Kind
								</td>
								<td colspan=15 width="15%" style="border:0"> 
									<gw:list value="ALL"  id="lst_Ins_kind" onchange="onchange_month()" maxlen = "100" styles='width:100%' >
												<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0041' AND NVL(B.CHAR_1,'N')='Y' ORDER BY B.CODE")%>|ALL|Select All</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Form
								</td>
								<td colspan=15 style="border:0" width="15%"  align="left" >
									<gw:list  id="lstForm" value="ALL" styles='width:100%' onChange="OnChangeForm()">
										<data>|1|01a_TBH|2|D02_TS|ALL|Select All</data>
									</gw:list>
								</td>
							</tr>
							<tr style="border:0;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"  >
									
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Nation
								</td>
								<td colspan=15 width="15%" style="border:0"  align="left" >
									<gw:list  id="lstNation"  value="01" styles='width:100%' >
										<data>
											<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...
										</data>
									</gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
									
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Set Report
								</td>
								<td colspan=13 width="13%" style="border:0"  align="left" >
									<gw:datebox id="idSetDate" lang="<%=Session("Lang")%>" type=date nullaccept></gw:datebox>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
									<gw:imgBtn id="ibtnSet" alt="Set Report Date" img="Set" text="Set Grid" onclick="OnSetDate()" />
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								<td colspan=8 width="8%" style="border:0"  align="left" >
									Report YN
								</td>
								<td colspan=15 width="15%" style="border:0"> 
									<gw:list  id="lstReportYN" value="ALL" styles='width:100%' onChange="OnChangeReport()">
									<data>|Y|Yes|N|No|ALL|Select All</data></gw:list>
								</td>
								<td colspan=2 width="2%" style="border:0"  >
								
								</td>
								
							</tr>							
						</table>
				</fieldset>
			</div>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:5%">
				<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
							<gw:checkbox id="chkCheckReport" value="F" onclick="OnSetGrid(chkCheckReport,idGrid,1)" ></gw:checkbox >
						</td>
						<td colspan=5 width="5%" style="border:0"  >
							Rows:
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:label id="idRecord" text=""  ></gw:label>
						</td>
						<td colspan=50 width="50%" style="border:0"  >
								
						</td>
						<td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="ibtnAdd" alt="Add New" img="new" text="" onclick="Add_new()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnUpdate()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
							<gw:button id="ibtnDel" alt="Delete" img="delete" text="" onclick="Delete_row()" />
						</td>						
						<td colspan=5 width="5%" style="border:0"> 
							<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnPrint()" />
						</td>
						<td colspan=8 width="8%" style="border:0"> 
							<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
						</td>
					</tr>
				</table>
			</div>
			<div style="width:100%;height:80%" >
				<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="1" >	
					<tr style="height:100%">
						<td id="master" width="100%">
							<gw:grid
								id="idGrid"
								
								header="_EMP_PK|Select|Organization|EMP_ID|FULL_NM|SOCIAL NO|KIND|OLD SAL|NEW SAL|INC SOCIAL|INC HEALTH|INC UNEMP|DEC SOCIAL|DEC HEALTH|DEC UNEMP|FROM MONTH|TO MONTH|NUM MONTH|RATE(%)|INC SOCIAL2|INC HEALTH2|INC UNEMP2|DEC SOCIAL2|DEC HEALTH2|DEC UNEMP2|BOOKS YN|MOD BYHAND|_MONTH|_TIMES|_PK|_OLD_KIND|REPORT DATE"
								format="0|3|0|0|0|0|2|1|1|1|1|1|1|1|1|0|0|1|0|1|1|1|1|1|1|3|0|0|0|0|0|4"
								aligns="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|1"
								defaults="|||||||||||||||||||||||||||||||"
								editcol="0|1|0|0|0|0|1|1|1|0|0|0|0|0|0|1|1|1|1|0|0|0|0|0|0|1|1|0|0|0|0|1"
								widths="0|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|0|1500"
								styles="width:100%;height:100%"
								sorting="T"
								onafteredit="onCheck_edit()"
								onbeforeedit = ""
								acceptNullDate="T"
								/>
						</td>
					</tr>	
				</table>
			</div>
		</td>
	</tr>
</table>

    <gw:textbox id="idEmployees" styles="display:none"/>
    <gw:textbox id="idAmount" styles="display:none"/>

	<gw:textbox id="txtMonth_flag" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtEmployee" styles="display:none"/>
    <gw:textbox id="txtAmount" styles="display:none"/>
	<gw:textbox id="txtTmpInput" styles="display:none"/>
    <gw:textbox id="txtTmpOutput" styles="display:none"/>

    <gw:textbox id="txtCompany_PK" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
</body>
</html>

