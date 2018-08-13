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

//"Seq|_PK|_EMP_PK|Organization|Emp ID|Full Name|Regulation Kind|Times Type|From Date|To Date|Hours|Times|Register DT|Description" 
//0,1,2,8,9,10,11,12,15
var stt = 0;
var v_seq 			=	stt;
var v_pk			=	++stt;
var v_emp_pk		=	++stt;
var v_dept			=	++stt;
var v_emp_id		=	++stt;
var v_full_name		=	++stt;
var v_reg_kind		=	++stt;
var v_reg_type		=	++stt;
var v_from_date		=	++stt;
var v_to_date		=	++stt;
var v_hours			=	++stt;
var v_times			=	++stt;
var v_register_date	=	++stt;
var v_remark		=	++stt;

var flag_tab=1;
var check_init=0;
function BodyInit()
{
    grdRegulation_Old.GetGridControl().ScrollTrack=true;    

    grdRegulation.GetGridControl().ScrollTrack=true;
    grdRegulation.GetGridControl().FrozenCols =6;

    grdRegulation1.GetGridControl().ScrollTrack=true;
    grdRegulation1.GetGridControl().FrozenCols =6;
    
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user= "<%=session("USER_ID")%>";
	txtLang.text = v_language;

    BindingDataList();    
   ibtnDelete.SetEnable(false);
   ibtnSave.SetEnable(false);
   //menu_id.text=System.Menu.GetMenuID();
   ChangeColorItem(lstOrg.GetControl());
   ChangeColorItem(lstOrg1.GetControl());
   
   datCheck_View.Call();
   
}
function BindingDataList()
{      
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0029' order by code_nm")%>";
    grdRegulation.SetComboFormat(v_reg_kind,t1);

    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,decode('" + Session("SESSION_LANG").ToString() + "', 'ENG', a.code_nm, a.code_fnm) from vhr_hr_code a where id='HR0119' union all select null,null from dual order by 1")%>";
    grdRegulation.SetComboFormat(v_reg_type,t1);
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00800', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00800', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport1.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	lstOrg1.SetDataText(data);
	lstOrg1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	lstWG1.SetDataText(data);
	lstWG1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0029', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstRegKind.SetDataText(data);
	lstRegKind.value ="ALL";
	lstRegKind1.SetDataText(data);
	lstRegKind1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0119', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstRegType.SetDataText(data);
	lstRegType.value ="ALL";
	lstRegType1.SetDataText(data);
	lstRegType1.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus1.SetDataText(data);
	lstStatus1.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('YN', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstMaternityYN.SetDataText(data);
	lstMaternityYN.value ="ALL";
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
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:240;edge:sunken;scroll:no;unadorned:yes;help:no');
    if (obj!=null)
    {
        if(n==1)
		{
            lstOrg.value=obj;
			//onChange_org(1,lstOrg);
		}	
        else  
		{
            lstOrg1.value=obj;   
			//onChange_org(2,lstOrg1);
		}	
        
    }
    
}
//----------------------------------------------------

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
        check_init =1;
   }
   else if (obj.id=="datRegulation")
   {
       lblRecord.text=grdRegulation.rows-1 ;
      
       if (grdRegulation.rows>1)
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
   else if (obj.id=="datRegulation_His")
   {
       lblRecord1.text=grdRegulation1.rows-1 ;
       
   }
   else if (obj.id=="datUser_info")
   {
        lstOrg.SetDataText(txtdept_temp.text);            
        lstOrg1.SetDataText(txtdept_temp.text);
        txtDept.text=lstOrg.value;

        ChangeColorItem(lstOrg.GetControl());
        ChangeColorItem(lstOrg1.GetControl());

		//onChange_org(0,lstOrg);
       
   }
   else if (obj.id=="datWorkGroup_info")
   {
		switch (flag_tab) 
		{
			case 0:
			{
				lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWG.value ="ALL";
				lstWG1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWG1.value ="ALL";
				break;
			}
			case 1:
			{
				lstWG.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWG.value ="ALL";
				break;
			}	
			case 2:
			{
				lstWG1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstWG1.value ="ALL";
				break;
			}
		}
		check_init=1;
		
   }
   else if(obj.id == "datFind_Report")
   {	
		var url = System.RootURL;
		switch(txtReportCode_tmp.text){
			case "25":
			{ 
				var url =url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG.value +  '&p_emp_search=' + txtEmployee.text 
					+ '&p_tco_org_pk=' + lstOrg.value + '&p_kind=' + lstRegKind.value + '&p_type=' + lstRegType.value + '&p_from_regdate=' +  dtBeginDate.value 
					+'&p_to_regdate=' + dtEndDate.value + '&p_status=' + lstStatus.value + '&p_mat_yn=' + lstMaternityYN.value
					+ '&p_lang='+ v_language;
					break;
			}
			case "26":
			{	
				var url =url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG1.value +  '&p_emp_search=' + txtEmployee1.text 
					+ '&p_tco_org_pk=' + lstOrg1.value + '&p_kind=' + lstRegKind1.value + '&p_type=' + lstRegType1.value + '&p_from_regdate=' +  dtBeginDate1.value 
					+'&p_to_regdate=' + dtEndDate1.value + '&p_status=' + lstStatus1.value 
					+ '&p_lang='+ v_language ;
					break;
			}
			
		}
		window.open(url);
	}
}
function OnReport()
{
	txtReportCode_tmp.text = lstReport.value;
	txtOrg_tmp_pk.text = lstOrg.value;
	datFind_Report.Call();
}
function OnReport1()
{
	txtReportCode_tmp.text = lstReport1.value;
	txtOrg_tmp_pk.text = lstOrg1.value;
	datFind_Report.Call();
}
//----------------------------------------------------
function OnSearch(datobj)
{
	if(check_init==1)
		datobj.Call("SELECT");
}
//-----------------------------------------------
function OnSave()
{
	if(check_init==1)
	{
		if (CheckUpdate())
			if ( confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?"))
				datRegulation.Call();
	}
    
}
//------------------------------------------
function OnDelete()
{
    if(confirm((v_language =="ENG")?"Do you want to delete?":"Bạn muốn xóa dữ liệu?"))
    {
       grdRegulation.DeleteRow();
       ibtnDelete.SetEnable(false);
	   datRegulation.Call();
    }
}

//=======================================================================
function OnAddNew()
{
	var path = System.RootURL + '/standard/forms/hr/em/hrem00801.aspx';
	var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	 
}
//-------------------------------------------------
function CheckUpdate()
{
    var v_mod=false;
    for (var i=1;i<=grdRegulation.rows-1;i++)
    {
        var sregkind=grdRegulation.GetGridData(i,v_reg_kind);
        var sremark=grdRegulation.GetGridData(i,v_remark);
		var sregtype=grdRegulation.GetGridData(i,v_reg_type);
        
        var sfromdate=grdRegulation.GetGridData(i,v_from_date);
        var stodate=grdRegulation.GetGridData(i,v_to_date);
        var spk=grdRegulation.GetGridData(i,v_pk);
        var shours=grdRegulation.GetGridData(i, v_hours);
		
        if (grdRegulation.GetRowStatus(i)==16  || grdRegulation.GetRowStatus(i)==64)
        {
            v_mod=true;
              
                if (sregkind=="") //regulation kind
                { 
                    alert((v_language =="ENG")?"You have to input regulation kind at row " + i:"Bạn hãy nhập loại chế độ ở dòng " + i );
                    return false;
                }
                if (sregtype=="")//regulation type
                {
                    alert((v_language =="ENG")?"You must input regulation type at row " + i:"Bạn hãy nhập loại chế độ ở dòng " + i  );
                    return false;
                }
				if (sfromdate == "")
				{
					alert((v_language =="ENG")?"You must input from date at row " + i:"Bạn hãy nhập ngày bắt đầu ở dòng " + i  );
                    return false;
				}
				if (stodate == "")
				{
					alert((v_language =="ENG")?"You must input to date at row " + i:"Bạn hãy nhập ngày kết thúc ở dòng " + i  );
                    return false;
				}
                if (shours == "")
				{
					alert((v_language =="ENG")?"You must input hours at row " + i:"Bạn hãy nhập số giờ ở dòng " + i  );
                    return false;
				}
                
            }
        
    }
    return v_mod;
}
function ResetData()
{
	var col, row
    
    col = event.col;
    row = event.row; 
	if(col == v_create)
	{
		if(grdRegulation.GetGridData(row, v_create) =="-1")
		{
			grdRegulation.SetGridText(row, v_reg_kind, "");
			grdRegulation.SetGridText(row, v_reg_type, "");
			grdRegulation.SetGridText(row, v_from_date, "");
			grdRegulation.SetGridText(row, v_to_date, "");
			grdRegulation.SetGridText(row, v_hours, "");
			grdRegulation.SetGridText(row, v_times, "");
			grdRegulation.SetGridText(row, v_register_date, "");
			grdRegulation.SetGridText(row, v_remark, "");
			
		}
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
<!------------------------------------------>
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
<gw:data id="datRegulation" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,2,6,7,8,9,10,13" function="ST_HR_SEL_HREM00800_0" procedure="ST_HR_UPD_HREM00800_0"> 
                <input bind="grdRegulation" >
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" />
                    <input bind="dtBeginDate" />
                    <input bind="dtEndDate" />
                    <input bind="txtEmployee" />
                    <input bind="lstRegKind" /> 
                    <input bind="lstRegType" /> 
                    <input bind="lstStatus" />	
				    <input bind="lstMaternityYN" />
                </input>
                <output  bind="grdRegulation" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datRegulation_His" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HREM00800_1"> 
                <input bind="grdRegulation1" >
                    <input bind="txtLang" /> 
                    <input bind="lstOrg1" /> 
                    <input bind="lstWG1" />
                    <input bind="dtBeginDate1" />
                    <input bind="dtEndDate1" />
                    <input bind="txtEmployee1" />
                    <input bind="lstRegKind1" />
                    <input bind="lstRegType1" />
		            <input bind="lstStatus1" />		
                </input>
                <output  bind="grdRegulation1" />
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"  > 
    <table name="Mangerment" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border-bottom:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:0px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>	
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Employee										
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:textbox id="txtEmployee" onenterkey   ="OnSearch(datRegulation)" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							
							<td colspan=12 style="border:0" width="12%" align="left" >
								Regulation Kind
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstRegKind" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Status</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus" value='A' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips"  >
								Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%' onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Maternity Date
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:datebox id="dtBeginDate" nullaccept  styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtEndDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Maternity Y/N
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstMaternityYN" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						
					</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:0px solid #62ac0d;width:100%;height:5%">					
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0">
							
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
							Rows:
							</td>
							<td colspan=5 width="5%" style="border:0" align="left"> 
								<gw:label id="lblRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=63 width="63%" style="border:0" align="center" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(datRegulation)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" id="ibtnSave"    alt="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="delete" id="ibtnDelete"    alt="Delete"  onclick="OnDelete()"/>
							</td>
							<td style="width: 5%">
								<gw:button id="btnNew" img="new" alt="Add New" text="Add new" onclick="OnAddNew()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
							</td>
							
						</tr>
					</table>

				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdRegulation"                                   
                                header="Seq|_PK|_EMP_PK|Organization|Emp ID|Full Name|Regulation Kind|Times Type|From Date|To Date|Hours|Times|Register DT|Description" 
                                format="0|0|0|0|0|0|0|0|4|4|-1|0|4|0"  
                                aligns="1|0|0|0|1|0|0|0|1|1|3|1|1|0"  
                                defaults="|||||||||||||"  
                                editcol="0|0|0|0|0|0|1|1|1|1|1|0|0|1"  
                                widths="500|0|0|2500|1500|1000|2500|1500|1500|1500|1500|700|700|1500|1500"  
                                styles="width:100%; height:100%" acceptNullDate
                                sorting="T" autosize="T"						
                                 />
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>
     <table name="History"  cellpadding="0" cellspacing="0" border=0 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
                <div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:0px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>	
					<table width="100%" id="tblexp" style="height:100%"  cellpadding="0" cellspacing="0">
						<tr style="border:0px;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:textbox id="txtEmployee1" onenterkey   ="OnSearch(datRegulation_His)" styles='width:100%'/>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Regulation Kind
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstRegKind1" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Regulation Type
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstRegType1" value='ALL' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr style="border:0px;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >								
								<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips"  >
									Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg1" value='ALL' maxlen = "100" styles='width:100%' onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Maternity Date
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:datebox id="dtBeginDate1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtEndDate1" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Status
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstStatus1" value='A' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
					</table>
					</fieldset>
				</div>
				<div style="border-top:px solid #62ac0d;border-left:px solid #62ac0d;border-right:px solid #62ac0d;border-bottom:0px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" ">
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >Rows:</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:label id="lblRecord1"  text="" maxlen = "100" />
							</td>
							<td colspan=75 width="75%" style="border:0" align="center">
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch1"   alt="Search"  onclick="OnSearch(datRegulation_His)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport1" alt="Report" img="excel" text="Report" onclick="OnReport1()"/>
							</td>				
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                id="grdRegulation1"  
                                header="No|_PK|_EMP_PK|_Create|Organization|_Group|Emp ID|Full Name|Regulation Kind|Regulation Type|From Date|To Date|Hours|Times|Register DT|Description" 
                                format="0|0|0|3|0|0|0|0|0|0|0|0|-1|0|0|0"  
                                aligns="1|0|0|0|0|0|1|0|0|0|1|1|3|1|1|0"  
                                defaults="|||||||||||||||"  
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
                                widths="500|0|500|700|2500|1500|1000|2500|1500|1500|1500|1500|700|700|1500|1500"  
                                styles="width:100%; height:100%" acceptNullDate
                                sorting="T"
								autosize="T"								
                                 />

							</td>
						</tr>
				   </table> 
				</div>
            </td>
        </tr>
    </table>
  </gw:tab>
<gw:textbox id="txtLang" styles="display:none"/>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none"/>
<gw:textbox id="txtReg_PK" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtDept" styles="display:none" />
<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:list  id="lstRegType" value='ALL' maxlen = "100" styles="display:none" />
<gw:list  id="lstReport" styles="color:blue;width:100%;display:none" onchange=""/>
<gw:list  id="lstReport1" styles="color:blue;width:100%;display:none" onchange=""/>
<gw:grid   
		id="grdRegulation_Old"  
		header="_Dept|Group|Emp ID|Full Name|Regulation Type|Remark|Times(H)|Reg Type|Test Weeks|Test Date|From Date|To Date|Register Times"   
		format="0|0|0|0|0|0|0|0|0|0|0|0|0"  
		aligns="2|2|1|0|1|2|1|1|1|1|1|1|1"  
		defaults="||||||||||||"  
		editcol="0|0|0|0|0|0|0|0|0|0|0|0|0"  
		widths="1500|1700|1000|2700|1900|1700|1200|1200|1200|1200|1200|1200|1600"  
		styles="width:100%;display:none; height:100%" acceptNullDate
		sorting="T"   
		 /> 
<gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstWG1" value='ALL' maxlen = "100" styles='width:100%;display:none' />
</body>


</html>
