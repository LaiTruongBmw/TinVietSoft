<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>

<script>
var startTime,interval_time
var v_language = "<%=Session("SESSION_LANG")%>";
var value_before=0;
var flag=0;
var col=0;
var row=0;
var _days=0;
var tmp1,tmp2;
var flag_open=0;
var col_f=1;//col ngay dau tien
var col_e=31; //col ngay cuoi cung
var tab_no=0;
var check_init = 0;

function BodyInit()
{   
   
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
     
    <%=CtlLib.SetGridColumnComboFormat( "grdWork" , 2 , "select pk, description from thr_work_shift a where a.del_if=0 and a.use_yn='Y' order by shift") %>;        
    <%=CtlLib.SetGridColumnComboFormat( "grdWork" , 5 , "SELECT A.CODE, A.CODE_NM   FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE B.ID = 'COAB0140'   AND A.TCO_ABCODEGRP_PK = B.PK AND A.DEL_IF = 0 AND B.DEL_IF = 0 union all select '','' from dual") %>;        
      
	lstHol.value="";
	iduser_pk.text = "<%=session("USER_PK")%>";   
	txtHr_level.text= "<%=session("HR_LEVEL")%>";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	txt_WG_temp1.SetDataText(data);
	txt_WG_temp1.value ="ALL";
	lstWG_S.SetDataText(data);
	lstWG_S.value ="ALL";
	lstWG2.SetDataText(data);
	lstWG2.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('WSHIFT', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWS_S.SetDataText(data);
	lstWS_S.value= "ALL";
	
    txt_WS_temp.text="<%=CtlLib.SetListDataSQL("select pk, description from thr_work_shift a where a.del_if=0 and a.use_yn='Y' order by a.shift") %>";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00300', 1 ,'" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstReport.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00300', 2 ,'" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport1.SetDataText(data);
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	//detail.style.display="none";
	
	var now = new Date(); 
	var ldate;
	ldate=dtFromDate.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	//FromDT.value=ldate ;
	dtFromDate.value=ldate ;
	
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
        datUser_info.Call(); 
    else
    {    
        txtCompanyPK.text=lstCompany.value;
	    //txtOrgPK.text=lstOrg.value;
        //datWorkGroup_info.Call();
		check_init = 1;
    }
  
    
}

function OnSearch(n)
{   
    if(check_init==1)
    {
        if(n==1)
        {
	       
            datWorkSchedule.Call("SELECT");
        }
        else    
            datWorkSchedule2.Call("SELECT");
     }       
}
function OnDelete()
{
    if(check_init==1)
    {
	    if (confirm((v_language =="ENG")?"Do you want to delete?":"Bạn muốn xóa dữ liệu?"))
            grdWork.DeleteRow();
			datWorkSchedule.Call();
    }
}


function OnSave(n)
{
    if(check_init==1)
    {
        if(n==1)
        {
	        if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn muốn lưu dữ liệu?"))
	        {
		        
		        datWorkSchedule.Call();
	        }	
	    }
	    else
	    {
	        if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn muốn lưu dữ liệu?"))
	            datWorkSchedule2.Call();
	    }   
	} 
	
}

function OnShowPopup(n)
{
         var strcom;
         var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
         if (obj!=null)
        {       if(n==1)
             lstOrg.value=obj;
             else
             lstOrg2.value=obj;
             
             ChangeOrganization(n)
        }
}


function OnDataReceive(obj) {
    if (obj.id == "datUser_info") {

        lstOrg.SetDataText(txt_temp.text);
        lstOrg2.SetDataText(txt_temp.text);
        txtCompanyPK.text = lstCompany.value;
        //datWorkGroup_info.Call();
    }
    
    if (obj.id == "datGet_period_kind") {
        idLst_period2.SetDataText(txt_temp2.text + "|M|Month");
        datGet_Period.Call();
    }
    
    if (obj.id == "datWorkSchedule") {
        
        idRecord.text = grdWork.rows - 1;
		datWorkSchedule_detail.Call("SELECT");
    }
    else if (obj.id == "WorkSchedule") {
       
        if (txtResult.text == '0') {
            alert((v_language =="ENG")?"Successful":"Thành công");
            OnSearch(1);
            //datWorkSchedule.Call("SELECT")
        }
        else
            alert((v_language =="ENG")?"Error during process":"Có lỗi xảy ra");


    }
    else if (obj.id == "datWorkSchedule2") {
        idRecord2.text = grdWork2.rows - 1 ;
        auto_resize_column(grdWork2, 0, grdWork2.cols - 1, 0);
        fill_sunday();
    }
    else if (obj.id == "datSunday") {
        fill_sunday();
        check_init = 1;
    }
    if (obj.id == "datGet_Period") {
        //alert(idMon_fr2.value);
        var n;
        _days = daysInMonth(idMon_fr2.value.substring(4, 6), idMon_fr2.value.substring(0, 4));
        tmp1 = Number(idMon_fr2.value.substring(6, 8));
        tmp2 = Number(idMon_to2.value.substring(6, 8));
        //alert(tmp2)
        if (tmp2 < _days)//chu ky giua thang
        {
            for (var i = tmp1; i <= 31 + tmp2; i++) {
                if (i > 31)
                    n = i - 31
                else
                    n = i
                grdWork2.SetGridText(0, i - tmp1 + col_f, n);
            }
            for (var i = 1; i <= 31 - _days; i++)
                grdWork2.GetGridControl().ColHidden(i + _days - tmp1 + col_f) = true;
        }
        else {
            for (var i = 1; i <= 31; i++)
                grdWork2.SetGridText(0, i + col_f - 1, i);

            for (var i = 1; i <= 31 - _days; i++)
                grdWork2.GetGridControl().ColHidden(i + _days + col_f - 1) = true;
        }

        if (idClose_flag2.text == "Y") {
            idRecord.text = (v_language =="ENG")?"This month is close":"Dữ liệu tháng này đã đóng";
            ibtnSave2.SetEnable(0);
        }
        else {
            idRecord.text = "";
            ibtnSave2.SetEnable(1);
        }
        datSunday.Call("SELECT");
    }

}
function fill_sunday()
{
    var tmp;
      
       grdWork2.SetCellBgColor(0, 0,0, grdWork2.cols-1, 0x000000);
      for(var i=1;i<grdWork3.rows;i++)
      {
        
        if(Number(grdWork3.GetGridData(i,0))<Number(idMon_fr2.value.substring(6,8)))
            tmp=31-Number(idMon_fr2.value.substring(6,8))+Number(grdWork3.GetGridData(i,0))+col_f;
        else
            tmp=Number(grdWork3.GetGridData(i,0))-Number(idMon_fr2.value.substring(6,8))+col_f;
            
        //alert(tmp);
        grdWork2.SetCellBgColor(0, tmp,grdWork2.rows-1, tmp, 0x3366FF );  
      }  
} 
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}      


function show_detail()
{
	txtMaster_pk.text=grdWork.GetGridData(event.row,4);
	if(imgMaster.status == "expand")
	    datWorkSchedule_detail.Call("SELECT")
}

function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            detail.style.display="none";
            imgMaster.status = "collapse";
			//tbl.style.width="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show detail"
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
			datWorkSchedule_detail.Call("SELECT")
          /*  tblMain.style.height="100%";
            tblUpper.style.height="5%";
            tblDetail.style.height="45%";
            tblMaster.style.height="50%";*/
            
        }
  
}
function onView(n) {
    if (n == 1) {
        var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00302.aspx";
        var obj = System.OpenModal(fpath, 450, 700, 'resizable:yes;status:yes');
    }
    else {
        if (row > 0 && col > 0 && grdWork2.GetGridData(row, col) != "") {
            var tmp, dt;
            tmp = Number(idMon_fr2.value.substring(6, 8)) + col - col_f;
            if (tmp > 31) {
                tmp = tmp - 31;
                if (tmp < 10)
                    dt = idMon_to2.value.substring(0, 6) + "" + "0" + tmp;
                else
                    dt = idMon_to2.value.substring(0, 6) + "" + tmp;
            }
            else {
                if (tmp < 10)
                    dt = idMon_fr2.value.substring(0, 6) + "" + "0" + tmp;
                else
                    dt = idMon_fr2.value.substring(0, 6) + "" + tmp;
            }
            //alert(idMon_to2.value + "  " + idMon_fr2.value + " " + (Number(idMon_fr2.value.substring(6, 8)) + col - col_f));
            var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00303.aspx?group_pk=" + grdWork2.GetGridData(row, 32) + "&dt=" + dt;
            var obj = window.showModalDialog(fpath, this, 'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:30;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        }
    }
}

function OnReport(n)
{
    if (n == 1)
        var url = System.RootURL + '/standard/reports/hr/ti/rpt_hrti00300_0.aspx?p_WG=' + lstWG.value + '&p_from=' + FromDT.value + '&p_to=' + ToDT.value;
    else
        var url = System.RootURL + '/standard/reports/hr/ti/rpt_hrti00300_1.aspx?p_WG=' + lstWG2.value + '&p_month=' + idWorkMon2.value;
    window.open(url);
}
function OnShowWorkShift()
{
    
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00200.aspx?shift=" + 0;
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:40;dialogHeight:15;dialogLeft:200;dialogTop:260;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
}
function onSetGrid()
{
    var ctrl = grdWork.GetGridControl();
	for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		{
			var row = ctrl.SelectedRow(i);
			if ( row > 0 )
			{		
				grdWork.SetGridText(row,5,lstHol.GetData());
			}		
		}
}
function OnChangeDate(Option, dtfrom, dtto)
{
	if(Option.value == "1") //daily
	{
		dtto.value = dtfrom.value;
	}
	else if(Option.value == "2") //weekly
	{
		dtto.SetDataText(System.AddDate(dtfrom.GetData(),7));
	}
	else if(Option.value == "3") //monthly
	{
		var ldate = dtfrom.value ; 
		lfromdate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
		ltodate = ldate.substr(0,4) + ldate.substr(4,2) ;
		ltodate = ltodate + getDaysInMonth(ltodate) ;
		dtfrom.value = lfromdate ;
		dtto.value = ltodate;
	}
} 
function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
{
   // returns the last day of a given month
    var m,y,tmpDate,checkMonth,lastDay
	
	m = Number(yyyymm.substr(4,2))-1;
		if(m==-1)
			m=Number(yyyymm.substr(5,1))-1;

	y = Number(yyyymm.substr(0,4));
	tmpDate = new Date(y, m, 28);
	checkMonth = tmpDate.getMonth();
	lastDay = 27;

    while(lastDay <= 31){
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++
    }
    return lastDay;
}
function onHide_column()
{
    //xac dinh thang co bao nhieu ngay 
     grdWork2.ClearData();   
        for(var i=1;i<=31;i++)
            grdWork2.GetGridControl().ColHidden(i)=0
            
        var n=getDaysInMonth(idWorkMon2.value);
        for(var i=n+1;i<=31;i++)
            grdWork2.GetGridControl().ColHidden(i)=1
	
    datSunday.Call("SELECT");    
	OnChangeMon2();		 
}
function onPageActive()
{
    if(tabMain.GetCurrentPageNo()==1)
    {
        if(flag_open==0)
        {
            flag_open=1;
            idMon_fr2.SetEnable(0);
            idMon_to2.SetEnable(0);
            OnChangeMon2();
            datGet_period_kind.Call();
         }   
    }
   
}
function on_check()
{
    var r=event.row;
    var c=event.col;
    if(c>0 && isNaN(grdWork2.GetGridData(event.row,event.col)))
    {
        alert((v_language =="ENG")?"Incorrect number of shift":"Nhập số thự tự ca làm việc");
        //alert(value_before);
        grdWork2.SetGridText(r,c,value_before);
    }    
}
function on_save_before()
{
    value_before=grdWork2.GetGridData(event.row,event.col);
    //alert(value_before);
}
function on_click()
{
    col=event.col;
    row=event.row;
}
function OnChangeMon2()
{
	for(var i=col_f;i<=col_e;i++)
		    grdWork2.GetGridControl().ColHidden(i)=false;
	datGet_Period.Call();
	
}

function daysInMonth(month, year) {
    return new Date(year, month, 0).getDate();
}


function ChangeOrganization(n)
{   if(n==1)
    {txtCompanyPK.text=lstCompany.value;
    tab_no=1;
    }
    if(n==2)
    {
   txtCompanyPK.text=lstCompany2.value;
    tab_no=2;
    }
    //datWorkGroup_info.Call();
}
function OnProcess()
{
	
	var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00301.aspx?tco_company_pk=" + lstCompany.value +"&wg_pk=" + lstWG_S.value + "&ws_pk=" + lstWS_S.value +"&dt_from=" + dtFromDate.text + "&dt_to=" + dtToDate.text;
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:35;dialogHeight:25;edge:sunken;scroll:yes;unadorned:yes;help:no');
	  
}

</script>

<body bgcolor='#FFFFFF' style="overflow-y: hidden;">
    <!------------------------------------------>
    <gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="list" procedure="ST_hr_sel_CO_wg_role_com"  > 
                <input>
                    <input bind="txtCompanyPK" />
                </input> 
                <output>
                    <output bind="txt_WG_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!------------------------------------->
    <!------------------------------------------>
    <gw:data id="datWorkShift_info" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="list" procedure="ST_HR_sel_CO_ws_role_com"  > 
                <input>
                    <input bind="txtCompanyPK" />
                </input> 
                <output>
                    <output bind="txt_WS_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!------------------------------------->
    <!------------main control---------------------->
    <gw:data id="datUser_info" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txt_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <!------------main control---------------------->
    <gw:data id="datWorkSchedule" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="1,2,3,4,5" function="ST_HR_SEL_HRTI00300_0" procedure="ST_HR_UPD_HRTI00300_0"> 
                <input bind="grdWork" >
                    <input bind="lstCompany" />
                    <input bind="lstWG_S" />
					<input bind="lstWS_S" />
                    <input bind="dtFromDate" />
                    <input bind="dtToDate" />
                    
                </input>
                <output  bind="grdWork" />
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datWorkSchedule_detail" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="1,2,4,5" function="ST_HR_SEL_HRTI00300_1" > 
                <input bind="grdDetail" >
                    <input bind="txtMaster_pk" />
                </input>
                <output  bind="grdDetail" />
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datWorkSchedule2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="ST_HR_SEL_HRTI00300_2" procedure="ST_HR_UPD_HRTI00300_2"> 
                <input bind="grdWork2" >
                    <input bind="lstWG2" />
                    <input bind="idWorkMon2" />
                    <input bind="idMon_fr2" />
                    <input bind="idMon_to2" />
                    <input bind="lstCompany2" />
                </input>
                <output  bind="grdWork2" />
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datSunday" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="1" function="ST_HR_sel_CO_sunday2"> 
                <input bind="grdWork3" >
                    <input bind="idWorkMon2" />
                     <input bind="idMon_fr2" />
                    <input bind="idMon_to2" />
                </input>
                <output  bind="grdWork3" />
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datGet_Period" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_hr_PRO_CO_sal_period_com" > 
                <input >
                    <input bind="lstCompany" />
                    <input bind="idWorkMon2" /> 
                    <input bind="idLst_period2" />
                </input>
                <output >
                    <output bind="idMon_fr2" /> 
                    <output bind="idMon_to2" /> 
                    <output bind="idnum_day2" />
                    <output bind="idClose_flag2" />  
                </output>
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datGet_period_kind" onreceive="OnDataReceive(this)"> 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_PERIOD_BY_ORG"  > 
                <input>
                    <input bind="lstCompany2" />
                </input> 
                <output>
                    <output bind="txt_temp2" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:tab id="tabMain" style="width: 100%; height: 100%;" onpageactivate="onPageActive()"> 
	<table name="Schedule" id="tab1" style="width:100%;height:100%;border:1px solid #62ac0d" cellpadding="0" cellspacing="0" align="top"  >
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:8%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0;width:100%;" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left">
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Work Group
									</td>
									<td colspan=20 width="20%" style="border:0" align="left"> 
										<gw:list  id="lstWG_S" value="ALL"  maxlen = "100" styles='width:100%' onchange="" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0")%>|ALL|Select All
											</data>
										</gw:list>
									</td>																		
									<td colspan=2 width="2%" style="border:0"></td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Work Shift
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstWS_S" value="ALL"  maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=2 width="2%" style="border:0" align="left" >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Holiday Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left" > 
										<gw:list  id="lstHol" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT A.CODE, A.CODE_NM   FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE B.ID = 'COAB0140'   AND A.TCO_ABCODEGRP_PK = B.PK AND A.DEL_IF = 0 AND B.DEL_IF = 0 union all select '','' from dual")%></data>
										</gw:list>
									</td>
									<td colspan=4 width="4%"></td>
								</tr>
								<tr style="border:0;width:100%" valign="center" >
	
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
									</td>
									<td colspan=20 width="20%" style="border:0" align="left" >
										<gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />																		
										~																		
										<gw:datebox id="dtToDate"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
									</td>
									<td colspan=68 width="38%" style="border:0"   >
										
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"></td>
							<td colspan=5 width="5%" style="border:0" align="left">
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord"  text="" maxlen = "100" />						
							</td>
							<td colspan=50 width="50%" style="border:0" align="left" ></td>
							
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt" styles='width:100%;display:none' img="excel" text="Report" onclick="OnReport(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" img="search" text="Search" onclick="OnSearch(1)" />
							</td>
							<td colspan=8 width="8%" style="border:0" align="left" >
								<gw:button id="idBtnSet"  styles='width:100%' img="set"  text="Set Grid"  onclick="onSetGrid()"/>
							</td>
							<td colspan=8 width="8%" style="border:0" align="left" >	
								<gw:button id="idBtnManual"  styles='width:90%' img="process"  text="Process"  onclick="OnProcess()"/>
							</td>
							
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave" img="save" text="Save" onclick="OnSave(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
							</td>
						</tr>
					</table>	
				</div>
				<div  style="width:100%;height:88%">
					<table style="width:100%;height:100%" >
						<td class="eco_line" id="master" style="width:70%;height:100%;border:1px" valign="top" rowspan="3">
							<table width="100%" style="height:94%;border:1px solid #62ac0d" cellpadding="2" cellspacing="1">
								<tr style="border:1px;width:100%;" valign="center" >
									<td  colspan="4" style="border:0"  >
										<gw:grid   
											id="grdWork"  
											header="WGroup|Work DT|WS|_Wgrp_pk|_master_pk|Holiday Type|Day Type"   
											format="0|4|0|1|0|2|0"  
											aligns="0|0|1|1|0|0|0"  
											defaults="||||||"  
											editcol="1|0|1|0|0|1|0"  
											widths="2000|1300|5500|0|0|1300|1300"  
											styles="width:100%; height:100%"   
											sorting="T"   
											param="0,1,2,3,4,5,6" 
											oncellclick     = "show_detail()" />
									</td>
								</tr>
							</table>
						</td>
						<td class="eco_line" style="width:70%;height:100%;border:1px" valign="top" rowspan="3"  id="detail" >
							<table width="100%" style="height:94%;border:1px solid #62ac0d" cellpadding="2" cellspacing="1">
								<tr style="border:1px;width:100%;" valign="center" >
									<td  style="border:0"  >
										<gw:grid   
											id="grdDetail"  
											header="Emp ID|Full Name|Join Dt"   
											format="0|0|4"  
											aligns="0|0|0"  
											defaults="||"  
											editcol="0|0|0"  
											widths="1000|2500|1000"  
											styles="width:100%; height:100%"   
											sorting="T"   
											param="0,1,2" 
											oncelldblclick     = "" />
									</td>
								</tr>
							</table>
						</td>
					</table>
				</div>
			</td>	
		</tr>
    </table>
    <table name="Monthly Schedule" id="Tab2" style="width:100%;height:100%;display:none" cellpadding="0" cellspacing="0" align="top" class="eco_line">
        <tr >
            <td valign="top">
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:8%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Group
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstWG2" value="ALL"  maxlen = "100" styles='width:100%' onchange="" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 style="border:0" width="12%" align="left" >
										Month Type
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="idLst_period2" value='01' maxlen = "100" styles='width:100%' onchange="OnChangeMon2()">
											<data> <%=CtlLib.SetListDataSQL("SELECT P.C1,P.C2     FROM(select S.ID C1,A.CODE_NM||' '|| A.CHAR_1||'->'||A.CHAR_2 C2      from thr_close s,VHR_HR_CODE A        where s.del_if=0 and a.ID='HR0030'   and s.id=a.code) P   GROUP BY P.C1,P.C2  ORDER BY P.C1")%>|M|By Month</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Work Month
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="idWorkMon2"  maxlen = "10" type="month" styles='width:60%'lang="<%=Session("Lang")%>" onchange="onHide_column()" />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Company</td>
									<td colspan=20 width="20%" style="border:0"> 
										 <gw:list  id="lstCompany2" value="" maxlen = "100" styles='width:100%' onchange="ChangeOrganization(2)" >
											<data>
												<%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and nvl(a.active_yn,'N')='Y' and (a.pk=nvl('" + session("COMPANY_PK") + "',a.pk) or '" + session("HR_LEVEL") + "'='6') order by A.PARTNER_ID")%>
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Work Date
									</td>
									<td colspan=10 width="10%" style="border:0" align="left">
										<gw:datebox id="idMon_fr2"  lang="<%=Session("Lang")%>" onchange="" />
									</td>
									<td colspan=10 width="10%" style="border:0" align="left">
										<gw:datebox id="idMon_to2"  lang="<%=Session("Lang")%>" onchange="" />
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
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord2"  text="" maxlen = "100"  />
							</td>
							<td colspan=25></td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<a class="eco_link" title="Click here to work shift information" onclick="OnShowWorkShift()" href="#tips" style="text-decoration: none; color=#0000ff" >Shift Info</a>
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<a class="eco_link" title="Click here to view detail" onclick="onView(2)" href="#tips" style="text-decoration: none; color=#0000ff" >View Detail</a>
							</td>
							<td colspan=25></td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch2" alt="Search" img="search" text="Search" onclick="OnSearch(2)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnSave(2)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt2" img="excel" text="Report" onclick="OnReport(2)" />
							</td>								
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:88%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr valign="top">
							<td class="eco_line_t">
								<gw:grid   
									id="grdWork2"  
									header="Group|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_grp_pk|_w_mon|_from|_to"   
									format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									defaults="|||||||||||||||||||||||||||||||||||"  
									editcol="0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0"  
									widths="2500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|0|0|0|0"  
									styles="width:100%; height:100%"   
									sorting="T"   
									onafteredit     = "on_check()" 
									onKeyPressEdit  = "on_save_before()"
									oncellclick     = "on_click()"    />
							</td>
						</tr>
					</table>
				</div>
            </td>
        </tr>        
	</table>
</gw:tab>
    <gw:textbox id="txtResult" styles="display:none" />
    <gw:textbox id="txtFlag" styles="display:none" />
    <gw:textbox id="txtOrgPK" styles="display:none" />
    <gw:textbox id="txtCompanyPK" styles="display:none" />
    <gw:textbox id="txtGroupData" styles="display:none" />
    <gw:textbox id="txtMaster_pk" styles="display:none" />
    <gw:textbox id="iduser_pk" styles="display:none" />
    <gw:textbox id="txtHr_level" styles="display:none" />
    <gw:textbox id="txt_temp" styles="display:none" />
    <gw:textbox id="txt_temp1" styles="display:none" />
    <gw:textbox id="txt_temp2" styles="display:none" />
    <gw:textbox id="txt_WS_temp" styles="display:none" />
    <gw:textbox id="txt_WG_temp1" styles="display:none" />
    <gw:textbox id="txt_WG_temp" styles="display:none" />
    <gw:textbox id="txt_Sal_kind" styles="display:none" />
    <gw:textbox id="idnum_day2" styles="display:none" />
    <gw:textbox id="idClose_flag2" styles="display:none" />
    <gw:textbox id="idResult2" styles="display:none" />
    <gw:grid id="grdWork3" header="1" format="0" aligns="0" defaults="|" editcol="0"
        widths="2500" styles="width:100%; height:100%;display:none" sorting="T" />
    <gw:list id="lstOrg" maxlen="100" styles='width:100%;display:none' onchange="ChangeOrganization(1)">
		<data>
			<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
		</data>
	</gw:list>
    <gw:list id="lstOrg2" maxlen="100" styles='width:100%;display:none' onchange="ChangeOrganization(1)">
		<data>
			<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>
		</data>
	</gw:list>
	<gw:list  id="lstCompany" value="" maxlen = "100" styles='width:100%;display:none' onchange="ChangeOrganization(1)" >
		<data>
			<%=CtlLib.SetListDataSQL("SELECT a.pk,A.PARTNER_NAME FROM tco_company a where a.del_if=0 and (a.pk=nvl('" + Session("COMPANY_PK") + "',a.pk) or '" + Session("HR_LEVEL") + "'='6') and nvl(a.active_yn,'N')='Y' order by A.PARTNER_ID")%>
		</data>
	</gw:list>
	<gw:list  id="lstReport"  maxlen = "100" styles='width:100%;display:none' ></gw:list>
	
	<gw:list  id="lstReport1" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
	<img status="expand" id="imgMaster" alt="Show month salary information" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle()" />
</body>
</html>
