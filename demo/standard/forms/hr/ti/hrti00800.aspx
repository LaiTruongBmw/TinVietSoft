<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var sun_day=new Array();
var mon_day=new Array();
var sun_col=new Array();
var dem_sun,dem_mon,dem_sun_col;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;
function BodyInit()
{
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());	
	
    txtM1.style.display="none";
    txtM2.style.display="none";
    label1.style.display="none";
    label2.style.display="none";
     iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";
    user= "<%=session("USER_ID")%>";
    lstReport2.SetEnable(0);
    idGrid1.GetGridControl().ScrollTrack=true;
    idGrid2.GetGridControl().ScrollTrack=true;
    idGrid3.GetGridControl().ScrollTrack=true;
    ChangeColorItem(lstOrg.GetControl());
    ChangeColorItem(lstOrg2.GetControl());
    ChangeColorItem(lstOrg3.GetControl());

    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00800', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport1.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00800', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport2.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00800', 3, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport3.SetDataText(data);

	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	lstOrg2.SetDataText(data);
	lstOrg2.value ="ALL";
	lstOrg3.SetDataText(data);
	lstOrg3.value ="ALL";
	
	ChangeColorItem(lstOrg.GetControl());
    ChangeColorItem(lstOrg2.GetControl());
    ChangeColorItem(lstOrg3.GetControl());
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	lstWG2.SetDataText(data);
	lstWG2.value ="ALL";
	lstWG3.SetDataText(data);
	lstWG3.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus2.SetDataText(data);
	lstStatus2.value ="A";
	lstStatus3.SetDataText(data);
	lstStatus3.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('WSHIFT', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWS.SetDataText(data);
	lstWS.value= "ALL";
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly|4|Yearly":"|1|Ngày|2|Tuần|3|Tháng|4|Năm";
	lstPeriod1.SetDataText(data);
	
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}
	else
        onChange_org();  

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
/**************** xu ly ngay ********************************/
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

function OnChangeDate1(Option, dtfrom, dtto)
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
	else if (Option.value=="4")
	{
		var ldate = dtfrom.value;
		lfromdate = ldate.substr(0,4) + '01'+'01';
		ltodate = ldate.substr(0,4) + '12' + '31';
		dtfrom.value = lfromdate;
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

/**************************************/
function addZero(num)//9=09
{
    if(num<10)
    {
	   return '0' + num;
	}
	else
	{
	   return  '' + num;
	}
 } 

function clear_data() //tra du lieu ve trang thai ban dau
{
	var i,j;
	//alert(mon_day.length)
	if(mon_day.length>0)
		for(i=0;i<dem_mon-1;i++)
			mon_day[i]=0
	if(sun_day.length>0)
		for(i=0;i<dem_sun-1;i++)
			sun_day[i]=0
		if(sun_day.length>0)
	for(i=0;i<dem_sun_col-1;i++)
			sun_col[i]=0
}


//------------------------------------------------------------------------------------
function onPage_active()
{
    if(tabMain.GetCurrentPageNo()==1)
    {
        txtDept.text=lstOrg2.value;
        //datGroupData.Call();
    }
    else if(tabMain.GetCurrentPageNo()==2)
    {
        txtDept.text=lstOrg3.value;
        //datGroupData.Call();
     }   
        
}
//-------------------------------------------------
function OnChangeDept(depObj)
{
    txtDept.text=depObj.value;
    //datGroupData.Call();
}
//-------------------------------------------------
function OnDataReceive(obj)
{
    var obj_lst;
       if (obj.id=="datDeptData")
       {
         if(txtHr_level.text=="6")
                txtDeptData.text=txtDeptData.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả";   
            switch (tabMain.GetCurrentPageNo())
            {
                case 0:
                {
                    lstOrg.SetDataText(txtDeptData.text);
                    txtDept.text=lstOrg.value;
                    break;
                }
                case 1:
                {
                    lstOrg2.SetDataText(txtDeptData.text);
                    txtDept.text=lstOrg2.value;
                    break;
                }
                case 2:
                {
                    lstOrg3.SetDataText(txtDeptData.text);
                    txtDept.text=lstOrg3.value;
                    break;
                }
            }  
            //datGroupData.Call();
       }
       else if (obj.id=="datWorkGroup_info")
       {
            if(tabMain.GetCurrentPageNo()==0)
            {
                //if(lstOrg.value=='ALL')
                //{                
                    lstWG.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG.value='ALL';
                //}
                //else
                  //  lstWG.SetDataText(txtwg_tmp.text);
            }
            if(tabMain.GetCurrentPageNo()==1)
            {
                //if(lstOrg2.value=='ALL')
                //{                
                    lstWG2.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG2.value='ALL';
                //}
                //else
                  //  lstWG2.SetDataText(txtwg_tmp.text);
            }
            if(tabMain.GetCurrentPageNo()==2)
            {
                //if(lstOrg3.value=='ALL')
                //{                
                    lstWG3.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG3.value='ALL';
                //}
                //else
                  //  lstWG3.SetDataText(txtwg_tmp.text);
            }
       }
       else if (obj.id=="datUser_info")
       {
            lstOrg.SetDataText(txtdept_temp.text);            
            lstOrg2.SetDataText(txtdept_temp.text);
            lstOrg3.SetDataText(txtdept_temp.text);
            
            txtDept.text=lstOrg.value;

            ChangeColorItem(lstOrg.GetControl());
            ChangeColorItem(lstOrg2.GetControl());
            ChangeColorItem(lstOrg3.GetControl());

            //datWorkGroup_info.Call();
            onChange_org();
       }
       else if (obj.id=="datTime_summary1")
       {
           idRecord.text=idGrid1.rows-1; 
           for(var i=1;i<idGrid1.rows;i++)
           {
                if(Number(idGrid1.GetGridData(i,12))<0||Number(idGrid1.GetGridData(i,13))<0)
                {
                    idGrid1.SetCellBgColor(i, 12,i, 13, 0x3366FF );
                    idGrid1.SetCellBold(i,12,i,13,true);
                }
           }
           auto_resize_column(idGrid1,0,idGrid1.cols-1,0)
       }
       else if (obj.id=="datTime_summary2")
       {
           idRecord2.text=idGrid2.rows-1; 
       }
       else if (obj.id=="datTime_summary3")
       {
           idRecord3.text=idGrid3.rows-1; 
       }
       else if (obj.id=="datFind_Report")
       {
           var url = System.RootURL;
           
           switch (txtReportCode_tmp.text) {
               case "109":
                   url = url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG.value + '&p_input=' + idtxtTmp.text + '&p_tco_org_pk=' + lstOrg.value + '&p_from=' + dtFromDate.value + '&p_to=' + dtToDate.value;
                   url = url + '&p_thr_ws_pk=' + lstWS.value + '&p_opt=' + idOpt.value + '&p_opt_text=' + idOpt.GetText() + "&p_m1=" + txtM1.text + "&p_m2=" + txtM2.text + "&p_nation=" + lstNation.value;
                   break;

               case "110":
                   url = url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG2.value + '&p_search=' + '&p_input=' + idtxtTmp2.text + '&p_tco_org_pk=' + lstOrg2.value + '&p_from=' + dtFromDate2.value + '&p_to=' + dtToDate2.value;
                   url = url + '&p_opt=' + idLstWT2.value + '&p_wt_ot=' + idtxtWT2.text + "&p_nation=" + lstNation2.value + "&p_status=" + lstStatus2.value + "&p_val=" + idLstVal2.value + '&p_lang='+ v_language;
                   break;

               case "114":
                   url = url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG3.value + '&p_search_temp=' + idtxtTmp3.text + '&p_tco_org_pk=' + lstOrg3.value + '&p_year=' + idYear3.value;
                   url = url + '&p_search_ot=' + idLstOT3.value + '&p_ot=' + idtxtOT3.text + '&p_nation=' + lstNation3.value + '&p_status='+ lstStatus3.value + '&p_lang=' + v_language;
                   break;
           }
    
            
            window.open(url);
       }
}   
//-------------------------------------------------
function OnShowPopup(num)
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(num==1)
        {
            lstOrg.value=obj
        }
        if(num==2)
        {
            lstOrg2.value=obj
        }    
        if(num==3)
        {
            lstOrg3.value=obj
        }
        //txtUpperDept.text=obj;
        onChange_org();
    }
    
}
//------------------------------------------------------------  
function OnSearch(obj)
{
    obj.Call("SELECT");
}
//-------------------------------------------------------------
function Popup(n)
{
    var col=event.col;
    if(n==1)
    {
        if(col<=4)//show time temp
        {
            //alert(idGrid1.GetGridData(event.row,17));
            var fpath = System.RootURL + "/standard/forms/hr/co/hrco00300.aspx?emp_pk=" + idGrid1.GetGridData(event.row, 17) + "&dt1=" + idGrid1.GetGridData(event.row, 18)
            + "&dt2=" +idGrid1.GetGridData(event.row,19)+ "&emp_id=" +idGrid1.GetGridData(event.row,3);
            var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:30;dialogHeight:35;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        }
     }
     else if(n==2)
     {
        if((col==1)||(col==3))//show time summary
        {
            var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00801.aspx?emp_id=" + idGrid2.GetGridData(event.row, 1) + "&dt1=" + dtFromDate2.value
            + "&dt2=" +dtToDate2.value;
            var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:35;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        }
     }
     else if(n==3)   //progressive ot
     {
        if(col>=1 && col<15)
        {   
            var ym;
            if(col==2||col==1)
                ym=idYear3.value;
            else if(col>2 && col<15)    
                ym=idYear3.value+""+addZero(col-2);
                
            var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00802.aspx?emp_pk=" + idGrid3.GetGridData(event.row, 16) + "&dt=" + ym;
             var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:35;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        }
     }
}    
//--------------------------------------------
function OnReport(obj)
{
    rpt_no=obj;
    var url;
    
    if (obj == 1) {
        txtReportCode_tmp.text = lstReport1.value;
        txtOrg_tmp_pk.text = lstOrg.value;
    }
    else if (obj == 2) {
        txtReportCode_tmp.text = lstReport2.value;
        txtOrg_tmp_pk.text = lstOrg2.value;
    }
    else if (obj == 3) {
        txtReportCode_tmp.text = lstReport3.value;
        txtOrg_tmp_pk.text = lstOrg3.value;
    }
    datFind_Report.Call();
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-----------------------------------------------------
function OnChangeOption()
{
    switch (Number(idOpt.value))
    {
        case 1:
        {
            txtM1.style.display="none";
            txtM2.style.display="none";
            label1.style.display="none";
            label2.style.display="none";
            break;
        }
        case 2:
        {
            txtM1.style.display="";
            txtM2.style.display="";
            label1.style.display="";
            label2.style.display="";
            label1.text="Minute"
            break;
        }
        case 3:
        {
            txtM1.style.display="";
            txtM2.style.display="";
            label1.style.display="";
            label2.style.display="";
            label1.text="Minute"
            break;
        }
        case 4:
        {
            txtM1.style.display="none";
            txtM2.style.display="none";
            label1.style.display="none";
            label2.style.display="none";
            break;
        }
        case 5:
        {
            txtM1.style.display="none";
            txtM2.style.display="none";
            label1.style.display="none";
            label2.style.display="none";
            break;
        }
        case 6:
        {
            txtM1.style.display="";
            txtM2.style.display="";
            label1.style.display="";
            label2.style.display="";
            label1.text="Minute"
            break;
        }
        case 7:
        {
            txtM1.style.display="";
            txtM2.style.display="";
            label1.style.display="";
            label2.style.display="";
            label1.text="HH:MM"
            break;
        }
        case 8:
        {
            txtM1.style.display="";
            txtM2.style.display="";
            label1.style.display="";
            label2.style.display="";
            label1.text="HH:MM"
            break;
        }
            
    }
    
}
function onChange_org()
{
    if(tabMain.GetCurrentPageNo()==0)
        txtOrg_tmp.text=lstOrg.value;
    if(tabMain.GetCurrentPageNo()==1)
        txtOrg_tmp.text=lstOrg2.value;
    if(tabMain.GetCurrentPageNo()==2)
        txtOrg_tmp.text=lstOrg3.value;
    datWorkGroup_info.Call();
}

function OnSearch_Tab2()
{

    datTime_summary2.Call("SELECT");
            
}

//-------------------------------------------------------------------------------------------
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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

<!------------------------------------------>
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtOrg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTime_summary1" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI00800_0" procedure="" parameter="1"> 
                <input bind="idGrid1"> 
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                    <input bind="idOpt" /> 
                    <input bind="lstWS" /> 
                    <input bind="idtxtTmp" />
                    <input bind="txtM1" />
                    <input bind="txtM2" />
                    <input bind="lstNation" />
                    <input bind="lstStatus" />
                </input> 
                <output bind="idGrid1"/>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datTime_summary2" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI00800_1" procedure="" parameter="1"> 
                <input bind="idGrid2"> 
                    <input bind="lstOrg2" /> 
                    <input bind="lstWG2" /> 
                    <input bind="dtFromDate2" /> 
                    <input bind="dtToDate2" /> 
                    <input bind="idLstWT2" /> 
                    <input bind="idLstVal2" /> 
                    <input bind="idtxtWT2" />
                    <input bind="idtxtTmp2" />
                    <input bind="lstNation2" />
                    <input bind="lstStatus2" />
                </input> 
                <output bind="idGrid2"/>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTime_summary3" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI00800_2" procedure="" parameter="1"> 
                <input bind="idGrid3"> 
                    <input bind="lstOrg3" /> 
                    <input bind="lstWG3" /> 
                    <input bind="idYear3" /> 
                    <input bind="idtxtTmp3" /> 
                    <input bind="idLstOT3" />
                    <input bind="idtxtOT3" />
                    <input bind="lstNation3" />
                    <input bind="lstStatus3" />
                </input> 
                <output bind="idGrid3"/>
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

   <!--------------------main table----------------------------------->
<gw:tab id="tabMain"  border="0" style="width:100%;height:100%;" onpageactivate="onPage_active()"  > 
    <table name="Time Summary" id="timesummary" width="100%" cellpadding="0"  cellspacing="0" style="height:100%;" class="eco_line">
        <tr style="width:100%;height:100%" valign="top">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Work Shift
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWS" value="ALL"  maxlen = "100" styles='width:100%' onchange="OnChangeShift()">
											<data><%=CtlLib.SetListDataSQL("SELECT pk,shift||'-'||remark FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus" value='A' styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0022' ORDER BY B.CODE")%>|ALL|Select All</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstOrg" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org()" >
											<data>
												<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>										
									</td>

									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToDate"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Option
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="idOpt" value="5" styles='width:100%' onChange="OnChangeOption()">
											<data>|1|Incorrect time|2|Lately|3|Early|4|Mod By hand|6|Lately or Early|7|InTime|8|OutTime|5|Select All</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
									
									</td>
									<td colspan=10 width="10%" style="border:0" align="left">
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left">
										
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<gw:label id="label1" text="Minute" styles="width:100%" ></gw:label>
									</td>
									<td colspan=9 width="9%" style="border:0"> 
										<gw:textbox id="txtM1" maxlen = "20" styles="width:96%" onenterkey="OnSearch(datTime_summary1)" />
									</td>
									<td colspan=2 width="2%" style="border:0"> 
										<gw:label id="label2" text="~" styles="width:100%" ></gw:label>
									</td>
									<td colspan=9 width="9%" style="border:0"> 
										<gw:textbox id="txtM2" maxlen = "20" styles="width:96%" onenterkey="OnSearch(datTime_summary1)" />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="width:100%;height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"  >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord" text="" ></gw:label>
							</td>
							<td colspan=45 width="45%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch(datTime_summary1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnReport(1)" />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr valign="top">
							<td colspan="2" class="eco_line_t">
								<gw:grid   
									id="idGrid1"  
									header="Organization|Group|Date|Emp ID|Name|Work Shift|IN|OUT|WT|OT|NT|NT2|ST|HT|Lately|Early|By Hand|Mod By|_EMP_PK|_DT IN|_DT OUT|_NO SCAN"   
									format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3"  
									aligns="0|0|0|1|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0"  
									defaults="|||||||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="1500|1200|1200|1000|2250|2000|800|800|500|500|500|500|500|500|800|800|1200|1000|1000|0|1200"  
									styles="width:100%; height:100%"  
									autosize= true
									sorting="T" oncelldblclick = "Popup(1)"  
									/>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
    </table>    
    <table name="WT & OT" id="wt_ot" width="100%" cellpadding="0"  cellspacing="0" style="height:100%;" class="eco_line">
		<tr style="width:100%;height:100%" valign="top">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >Employee</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp2" maxlen = "50" styles="width:100%" onenterkey="OnSearch_Tab2()" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >										
									</td>
									<td colspan=10 style="border:0" width="10%" align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWG2" value="ALL"  maxlen = "100" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus2" value='A' maxlen = "100" styles='width:100%'>
											<data>
												<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg2" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org()" >
											<data>
												<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<gw:list  id="lstPeriod1" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate1(lstPeriod1, dtFromDate2, dtToDate2)" />
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtFromDate2" onchange="OnChangeDate1(lstPeriod1, dtFromDate2, dtToDate2)" styles="width:100%" lang="<%=Session("Lang")%>"/>
										~
										<gw:datebox id="dtToDate2" styles="width:100%" lang="<%=Session("Lang")%>"/>
									</td>	
									<td colspan=2 width="2%" style="border:0"   >										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Option
									</td>
									<td colspan=7 width="7%" style="border:0" align="left">
										<gw:list  id="idLstWT2" value="1" styles="width:100%" onChange="">
											<data> LIST|1|WT|2|OT|3|HT|4|WT+OT|5|OT+HT</data>
										</gw:list>
									</td>
									<td colspan=6 width="6%" style="border:0"   >
										<gw:list  id="idLstVal2" value="1" styles="width:100%" onChange="">
											<data> LIST|=|=|>|>|<|<|>=|>=|<=|<=</data>
										</gw:list>
									</td>
									<td colspan=7 width="7%" style="border:0" align="left">
										<gw:textbox id="idtxtWT2" maxlen = "20" styles="width:100%" onenterkey="OnSearch_Tab2()" />
									</td>
								</tr>								
							</table>						
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord2" text="" ></gw:label>
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch2" alt="Search" img="search" text="Search" onclick="OnSearch_Tab2()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt2" alt="Report" img="excel" text="Report" onclick="OnReport(2)" />
							</td>						
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:96%" width=100% border=0>
						<tr valign="top">
							<td colspan="2" class="eco_line_t">
								<gw:grid   
									id="idGrid2"  
									header="Organization|Group|Emp ID|Join date|Name|WT|OT|NT|ONT|ST|HT|Total WT+OT|Total OT+HT|Total Night OT"   
									format="0|0|0|4|0|0|0|0|0|0|0|0|0|0"  
									aligns="0|0|0|0|0|3|3|3|3|3|3|3|3|3"  
									defaults="|||||||||||||||"  
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="3000|1200|1200|1500|3000|800|800|800|800|800|800|1200|1200|1500"  
									styles="width:100%; height:100%"  
									autosize= true
									sorting="T" oncelldblclick = "Popup(2)" /> 
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
    </table>
    <table name="MONTHLY OT" id="Table1" width="100%" cellpadding="0"  cellspacing="0" style="height:100%;" class="eco_line">
        <tr>
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp3" maxlen = "50" styles="width:100%" onenterkey="OnSearch(datTime_summary3)" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list  id="lstWG3" value="ALL"  maxlen = "100" styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus3" value='A' styles='width:100%' >
											<data><%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM VHR_HR_CODE B WHERE B.ID='HR0022' ORDER BY B.CODE")%>|ALL|Select All</data>
										</gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(3)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:list  id="lstOrg3" value="ALL"  maxlen = "100" styles='width:100%' onchange="onChange_org()" >
											<data>
												<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
											</data>
										</gw:list>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Year
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="idYear3" styles="width:100%" lang="<%=Session("Lang")%>" type="year"/>
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Option
									</td>
									<td colspan=10 width="10%" style="border:0"> 
										<gw:list  id="idLstOT3" value="1" styles="width:100%" onChange="">
											<data> LIST|1|TOTAL OT >=|2|TOTAL OT <</data>
										</gw:list>
									</td>
									<td colspan=10 width="10%" style="border:0"> 
										<gw:textbox id="idtxtOT3" maxlen = "20" styles="width:100%" onenterkey="OnSearch(datTime_summary3)" />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord3" text="" ></gw:label>
							</td>
							<td colspan=75 width="75%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch3" alt="Search" img="search" text="Search" onclick="OnSearch(datTime_summary3)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt3" alt="Report" img="excel" text="Report" onclick="OnReport(3)" />
							</td>							
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:96%" width=100% border=0>
						<tr valign="top">
							<td colspan="2" class="eco_line_t">
								<gw:grid   
									id="idGrid3"  
									header="ORGANIZATION|EMP ID|NAME|JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC|TOTAL|_EMP_PK"   
									format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									aligns="0|0|2|1|1|1|1|1|1|1|1|1|1|1|1|2|1"  
									defaults="||||||||||||||||"  
									editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
									widths="2000|1200|2600|600|600|600|600|600|600|600|600|600|600|600|600|1000|1000"  
									styles="width:100%; height:100%"   
									sorting="T" autosize= true
									oncelldblclick = "Popup(3)" /> 
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
    </table>
    </gw:tab>

    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>  
    <gw:textbox id="txtReport_tmp" styles="display:none"/>  
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtCompany_pk" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>    
    <gw:textbox id="txtOrg_tmp" styles="display:none"/> 
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
	<gw:list id="lstNation" value='ALL' styles="width:100%;display:none">
        <data>
            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.ID='HR0009'")%>|ALL|Select All
        </data>
    </gw:list>
	<gw:list  id="lstWG" value="ALL"  maxlen = "100" styles='width:100%' >
		<data><%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All</data>
	</gw:list>
	<gw:list  id="lstReport1" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
	<gw:list id="lstNation2" value='ALL' styles="width:100%;display:none">
		<data>
			<%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.ID='HR0009'")%>|ALL|Select All
		</data>
	</gw:list>
	<gw:list  id="lstReport2" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
	<gw:list id="lstNation3" value='ALL' styles="width:100%;display:none">
		<data>
			<%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.ID='HR0009'")%>|ALL|Select All
		</data>
	</gw:list>
	<gw:list  id="lstReport3" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
</body>

   
</html>
