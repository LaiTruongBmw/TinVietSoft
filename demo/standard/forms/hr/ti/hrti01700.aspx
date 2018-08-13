<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var startTime,interval_time;
var dt_tmp;
var opt_value=1;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var check_init=0;
//""_No|Organization Name|Emp ID|Full Name|_Organization|_Position|_Job|Month|Confirm Date
//|D1|D2|D3|D4|D5|D6|D7|D8|D9|D10|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|D24|D25|D26|D27|D28|D29|D30|D31
//|Total WT|Annual Abs|Other ABS Pay |Total ABS Pay|Total ABS No Pay|OT 1.5|OT 2.0|OT 3.0|NT|NT2|Total Days
//|_D1_TYPE|_D2_TYPE|_D3_TYPE|_D4_TYPE|_D5_TYPE|_D6_TYPE|_D7_TYPE|_D8_TYPE|_D9_TYPE|_D10_TYPE|_D11_TYPE|_D12_TYPE|_D13_TYPE|_D14_TYPE
//|_D15_TYPE|_D16_TYPE|_D17_TYPE|_D18_TYPE|_D19_TYPE|_D20_TYPE|_D21_TYPE|_D22_TYPE|_D23_TYPE|_D24_TYPE|_D25_TYPE|_D26_TYPE|_D27_TYPE|_D28_TYPE|_D29_TYPE|_D30_TYPE|_D31_TYPE"
var G1_PK 			= 0,
	G1_ORG_NAME		= 1,
	G1_EMP_ID 		= 2,
	G1_FULL_NAME 	= 3,
	G1_ORGANIATION 	= 4,
	G1_POSITION 	= 5,
	G1_JOB 			= 6,
	G1_MONTH 		= 7,
	G1_CONFIRM_DT 	= 8,
	G1_D1		= 9,
	G1_D2 		= 10,
	G1_D3 		= 11,
	G1_D4 		= 12,
	G1_D5 		= 13,
	G1_D6 		= 14,
	G1_D7 		= 15,
	G1_D8 		= 16,
	G1_D9 		= 17,
	G1_D10 		= 18,
	G1_D11		= 19,
	G1_D12 		= 20,
	G1_D13 		= 21,
	G1_D14 		= 22,
	G1_D15 		= 23,
	G1_D16 		= 24,
	G1_D17		= 25,
	G1_D18 		= 26,
	G1_D19 		= 27,
	G1_D20 		= 28,
	G1_D21 		= 29,
	G1_D22 		= 30,
	G1_D23 		= 31,
	G1_D24 		= 32,
	G1_D25 		= 33,
	G1_D26 		= 34,
	G1_D27		= 35,
	G1_D28 		= 36,
	G1_D29 		= 37,
	G1_D30 		= 38,
	G1_D31 		= 39, 
	G1_TOTAL_WT = 40, //|Total WT|Annual Abs|Other ABS Pay |Total ABS Pay|Total ABS No Pay|OT 1.5|OT 2.0|OT 3.0|NT|NT2|Total Days
	G1_ANNUAL_ABS 		= 41,
	G1_OTHER_ABS_PAY	= 42,
	G1_TOTAL_ABS_PAY 	= 43,
	G1_TOTAL_ABS_NO_PAY	= 44,
	G1_OT_15 		= 45,
	G1_OT_20 		= 46,
	G1_OT_30		= 47,
	G1_NT		    = 48,
	G1_ONT			= 49,
	G1_TOTAL_DAYS	= 50,
	G1_D1_TYPE	= 51,  //|_D1_TYPE|_D2_TYPE|_D3_TYPE|_D4_TYPE|_D5_TYPE|_D6_TYPE|_D7_TYPE|_D8_TYPE|_D9_TYPE|_D10_TYPE|_D11_TYPE|_D12_TYPE|_D13_TYPE|_D14_TYPE
	G1_D2_TYPE	= 52,  //|_D15_TYPE|_D16_TYPE|_D17_TYPE|_D18_TYPE|_D19_TYPE|_D20_TYPE|_D21_TYPE|_D22_TYPE|_D23_TYPE|_D24_TYPE|_D25_TYPE|_D26_TYPE|_D27_TYPE|_D28_TYPE|_D29_TYPE|_D30_TYPE|_D31_TYPE"
	G1_D3_TYPE	= 53,
	G1_D4_TYPE	= 54,
	G1_D5_TYPE	= 55,
	G1_D6_TYPE	= 56,
	G1_D7_TYPE	= 57,
	G1_D8_TYPE	= 58,
	G1_D9_TYPE	= 59,
	G1_D10_TYPE	= 60,
	G1_D11_TYPE	= 61,
	G1_D12_TYPE	= 62,
	G1_D13_TYPE	= 63,
	G1_D14_TYPE	= 64,
	G1_D15_TYPE	= 65,
	G1_D16_TYPE	= 66,
	G1_D17_TYPE	= 67,
	G1_D18_TYPE	= 68,
	G1_D19_TYPE	= 69,
	G1_D20_TYPE	= 70,
	G1_D21_TYPE	= 71,
	G1_D22_TYPE	= 72,
	G1_D23_TYPE	= 73,
	G1_D24_TYPE	= 74,
	G1_D25_TYPE	= 75,
	G1_D26_TYPE	= 76,
	G1_D27_TYPE	= 77,
	G1_D28_TYPE	= 78,
	G1_D29_TYPE	= 79,
	G1_D30_TYPE	= 80,
	G1_D31_TYPE	= 81;
	
function BodyInit()
{
    
    System.Translate_V2(document, System.Menu.GetMenuPS());	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";
    user= "<%=session("USER_NAME")%>";
    menu_id.text=System.Menu.GetMenuID();
    var tmp;
    
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00700', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	ChangeColorItem(lstOrg.GetControl());
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstSalaryPeriod.SetDataText(data);
	
	var ctr = grd_att.GetGridControl(); 
    //ctr.ColFormat(G1_WT) = "###.##";
    //ctr.ColFormat(G1_OT) = "###.##";
	ctr.FrozenCols = G1_D1 ; 
	
    datCheck_View.Call();
	

}
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
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj
        txtUpperDept.text=obj;
        
    }
    
}

//------------------------------------------------------------------------------------
function OnDataReceive(obj) 
{
    if (obj.id == "datCheck_View") 
	{
        if (txtFlag_View.text == 'Y') 
		{
            ibtnSave.style.display = "none";
            ibtnDelete.style.display = "none";
        }
		
        if ((Trim(iduser_pk.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
        {
            datUser_info.Call();
        }
		else 
		{
			
			pro_hrti01700_0.Call();
			check_init = 1;
		}
        
    }
	else if (obj.id == "datUser_info")
	{
		check_init = 1;
		ChangeColorItem(lstOrg.GetControl());
		pro_hrti01700_0.Call();
	}
    else if (obj.id == "data_hrti01700_0") 
	{
		idRecord.text = grd_att.rows - 1;
		if(grd_att.rows > 1)
		{
			grd_att.SetCellBold( 1, G1_TOTAL_WT, grd_att.rows - 1, G1_TOTAL_WT, true);
			grd_att.SetCellBold( 1, G1_TOTAL_DAYS, grd_att.rows - 1, G1_TOTAL_DAYS, true);
			//grd_att.SetCellBold( 1, G1_TOTAL_WD_ABS, grd_att.rows - 1, G1_TOTAL_WD_ABS, true);
			//grd_att.SetCellBold( 1, G1_TOTAL_WT, grd_att.rows - 1, G1_TOTAL_WT, true);
			
			for (var i = 1; i < grd_att.rows; i++) 
			{	
				for(var k = 0; k < 32; k++ )
				{
					if (Trim(grd_att.GetGridData(i, G1_D1_TYPE + k)) == "SUN") 
					{
						grd_att.SetCellBgColor(i, G1_D1 + k , i, G1_D1 + k, 0x99FFCC);
					}
					if (Trim(grd_att.GetGridData(i, G1_D1_TYPE + k)) == "HOL") 
					{
						grd_att.SetCellBgColor(i, G1_D1 + k, i, G1_D1 + k, 0xc0cbff);
					}
				}
			}  
		}
		auto_resize_column(grd_att, 0, grd_att.cols - 1, 0);
        //OnSetRowHeight(); 
		//grd_att.Subtotal(0, 2, 1, '9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45!46!47!48!49!50!51!52!53!54!55!56!57!58!59!60');
    }
	else if(obj.id =="pro_hrti01700_0")
	{ 
		if(txtFlagClose_YN.text == "Y")
		{
			ibtnOpen.SetEnable(true);
			ibtnClose.SetEnable(false);
			ibtnProcess.SetEnable(false);
			lblStatus.text = (v_language =="ENG")?"Data is closed":"Dữ liệu đã đóng";
		}
		else
		{
			ibtnOpen.SetEnable(false);
			ibtnClose.SetEnable(true);
			ibtnProcess.SetEnable(true);
			lblStatus.text = (v_language =="ENG")?"Data is opening":"Dữ liệu đang mở";
		}
		data_hrti01700_1.Call("SELECT");
		
	}
    else if (obj.id == "datFind_Report") {
        var url = System.RootURL;
        url = url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG.value + '&p_search_temp=' + txtEmployee.text + '&p_tco_org_pk=' + lstOrg.value + '&p_from_date=' + txtFrom.text + '&p_to_date=' + txtTo.text + '&p_work_shift=' + lstWS.value + '&p_date_type=' + opt_value + '&p_nation=' + lstNation.value + '&p_reg=' + lstReg.value + '&p_com=' + txtCompany_pk.text + '&p_data_type=' + idPrint_type.value + '&p_confirm=' + idConfirm.value;
        window.open(url);
    }
    else if (obj.id == "data_hrti01700_1") 
	{    
        for(var i = 1; i< grd_day.rows; i++)
		{
			grd_att.SetGridText(0, G1_D1 + i -1 , grd_day.GetGridData(i,0));
		} 
		
		if(grd_day.rows == 29)
		{
			grd_att.GetGridControl().ColHidden(G1_D29)=! 0;
			grd_att.GetGridControl().ColHidden(G1_D30)=! 0;
			grd_att.GetGridControl().ColHidden(G1_D31)=! 0;
		}
		else if(grd_day.rows == 30)
		{
			grd_att.GetGridControl().ColHidden(G1_D30)=! 0;
			grd_att.GetGridControl().ColHidden(G1_D31)=! 0;
		}
		else if(grd_day.rows == 31)
		{
			grd_att.GetGridControl().ColHidden(G1_D31)=! 0;
		}
		else
		{
			grd_att.GetGridControl().ColHidden(G1_D29)=! 1;
			grd_att.GetGridControl().ColHidden(G1_D30)=! 1;
			grd_att.GetGridControl().ColHidden(G1_D31)=! 1;
		}
		//data_hrti01700_0.Call("SELECT");	
	}
	else if(obj.id == "pro_hrti01700_1")
	{
		if(txtResult.text =="1")
		{
			alert((v_language =="ENG")?"Sucessful":"Thành công?");
		}
		else 
			alert((v_language =="ENG")?"System fail":"Xảy ra lỗi?");
			
		pro_hrti01700_0.Call();	
	}
}
function OnDataError(obj) 
{
	if(obj.id == "pro_hrti01700_1")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
}

//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}


function OnSearch()
{
	if(check_init==1)
	{
		data_hrti01700_0.Call("SELECT");
		
	}	
    
}

function OnProcess()
{
	
	var fpath = System.RootURL + "/standard/forms/hr/ti/hrti01701.aspx?dtMonth=" + dtMonth.value +"&emp_id=" + txtEmployee.text;;
    //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:35;dialogHeight:25;edge:sunken;scroll:yes;unadorned:yes;help:no');
    var obj=System.OpenModal( fpath ,500, 400 ,  'resizable:yes;status:yes',this);
	  //var path = System.RootURL + '/standard/forms/hr/ti/hrti01702.aspx';
	//var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);			
}

function On_click(obj)
{
    if(obj==1)
		dt_tmp = grd_att.GetGridData(event.row,event.col)//luu tru gia tri vua click
	else 
		dt_tmp = grd_att2.GetGridData(event.row,event.col)//luu tru gia tri vua click
}


//---------------------------------
function OnReport(pos)
{
	switch (pos)
	{		
		
		case '1':
			var url = System.RootURL;
			url = url + "/standard/reports/hr/ti/rpt_hrti01700_1.aspx?l_emp_id=" + txtEmployee.text + '&l_work_mon=' + dtMonth.value 
			+ '&l_tco_org_pk=' + lstOrg.value +'&dt_from=' + txtFrom.text + '&dt_to=' + txtTo.text +'&l_sal_period=' + lstSalaryPeriod.value
			+ '&l_nation=' + lstNation.value ;
			 
			System.OpenTargetPage(url);		
		break;
		case '2':
			var url = System.RootURL;
			url = url + "/standard/reports/hr/ti/rpt_hrti01700_0.aspx?l_emp_id=" + txtEmployee.text + '&l_work_mon=' + dtMonth.value 
			+ '&l_tco_org_pk=' + lstOrg.value +'&dt_from=' + txtFrom.text + '&dt_to=' + txtTo.text +'&l_sal_period=' + lstSalaryPeriod.value
			+ '&l_nation=' + lstNation.value ;
			 
			System.OpenTargetPage(url);		
		break;
	}
         
}
function OnChangeTimes()
{
	pro_hrti01700_0.Call();
	 
}
function OnCloseOpen(obj)
{
	var txtStatusEng;
	var txtStatusVie;
	if(obj =="Open")
	{
		txtCloseOpen.text = "OPEN";
		txtStatusEng = "open";
		txtStatusVie = "mở";
	}
	else
	{
		txtCloseOpen.text = "CLOSE"
		txtStatusEng = "close";
		txtStatusVie = "đóng";
	}
		
	
	if (confirm((v_language =="ENG")?"Do you want to "+ txtStatusEng +"?":"Bạn có muốn "+ txtStatusVie +" dữ liệu?"))
	{	
		pro_hrti01700_1.Call();
	}
}
function OnPrint()
{
	var path = System.RootURL + '/standard/forms/hr/ti/hrti01702.aspx';
	var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);			
  
}
function OnSetRowHeight() 
{
	var grd=grd_att.GetGridControl();
	//grd.RowHeightMin = 350;
	//grd.AutoSizeMode = 1; //auto size cho header
	//grd.AutoSize(2,3,true);
	//grd.RowHeight(4) = 300;
	//grd.ClientHeight = 800;
	//grd.WordWrap = true;
	grd.AutoSize(0, grd.Cols - 1);

}

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------------------------------------>
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
<gw:data id="data_hrti01700_0" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRTI01700_0" > 
                <input bind="grd_att" >
					<input bind="txtEmployee" />
					<input bind="dtMonth" />
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="lstNation" />
                    <input bind="lstSalaryPeriod" />
                </input>
                <output  bind="grd_att" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="data_hrti01700_1" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRTI01700_1" > 
                <input bind="grd_day" >
					<input bind="lstOrg" />
					<input bind="txtFrom" />
                    <input bind="txtTo" />
                </input>
                <output  bind="grd_day" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="pro_hrti01700_0" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_pro_hrti01700_0" > 
                <input>
					<input bind="lstOrg" />
                    <input bind="dtMonth" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtFrom" />
                    <output bind="txtTo" />
                    <output bind="txtFlagClose_YN" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="pro_hrti01700_1" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)" > 
        <xml> 
            <dso  type="process" procedure="ST_HR_pro_hrti01700_1" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="lstOrg" />
                    <input bind="lstSalaryPeriod" />
                    <input bind="txtCloseOpen" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<table style="width:100%;height:100%" cellpadding="0" border="0" cellspacing="0" align="top" >   
    <tr style="width:100%;height:100%" valign="top">
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:12%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:textbox id="txtEmployee" maxlen = "20" styles="width:100%" onenterkey="OnSearch()" />
								</td>
								<td colspan=2 width="2%" style="border:0" align="right"  >
									
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Month
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:datebox id="dtMonth"  maxlen = "10" type="month" styles='width:100%' onchange="OnChangeTimes()" />
								</td>
								<td colspan=2 width="2%" style="border:0"  align="left" >	
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Status : 
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									<gw:label id="lblStatus" text="" styles="color:red;width:100%;font-weight: bold;font-size:12" ></gw:label>
								</td>
								
								
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" align="left"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									Organization
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list  id="lstOrg"  maxlen = "100" styles='width:100%' onchange="pro_hrti01700_0.Call()"  />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 style="border:0" width="10%" align="left" >
									Group
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstWG"  maxlen = "100" styles='width:100%' />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Nation
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list id='lstNation' value='ALL' />
								</td>
							</tr>							
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >	
						<td colspan=2 width="2%" style="border:0" align="left"  >
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
							<gw:button id="ibtnSearch" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnPrint()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnProcess" img="process" text="Process" onclick="OnProcess()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnOpen" img="lock_open" text="Open" onclick="OnCloseOpen('Open')" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnClose" img="lock" text="Close" onclick="OnCloseOpen('Close')" />
						</td>					
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:84%">
				<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
					<tr valign="top">
						<td width="100%" height="100%">	
							<gw:grid
								id="grd_att"
								header="_No|Organization|Emp ID|Full Name|_Organization|_Position|_Job|Month|Confirm Date|D1|D2|D3|D4|D5|D6|D7|D8|D9|D10|D11|D12|D13|D14|D15|D16|D17|D18|D19|D20|D21|D22|D23|D24|D25|D26|D27|D28|D29|D30|D31|Total WT|Annual Abs|Other ABS Pay |Total ABS Pay|Total ABS No Pay|OT 1.5|OT 2.0|OT 3.0|NT|ONT|Total(WT+ABS)
											|_D1_TYPE|_D2_TYPE|_D3_TYPE|_D4_TYPE|_D5_TYPE|_D6_TYPE|_D7_TYPE|_D8_TYPE|_D9_TYPE|_D10_TYPE|_D11_TYPE|_D12_TYPE|_D13_TYPE|_D14_TYPE|_D15_TYPE|_D16_TYPE|_D17_TYPE|_D18_TYPE|_D19_TYPE|_D20_TYPE|_D21_TYPE|_D22_TYPE|_D23_TYPE|_D24_TYPE|_D25_TYPE|_D26_TYPE|_D27_TYPE|_D28_TYPE|_D29_TYPE|_D30_TYPE|_D31_TYPE"
								format="0|0|0|0|0|0|0|0|0 |0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0 |0|0|0|0|0|0|0|0|0|0|0 
										|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								aligns="0|0|0|0|0|0|0|3|3 |3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3 |3|3|3|3|3|3|3|3|3|3|3
										|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
							   editcol="0|0|0|0|0|0|0|0|0 |0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0 |0|0|0|0|0|0|0|0|0|0|0 
										|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								widths="500|3500|1000|2500|1500|1500|1500|1000|1500 |500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500 |1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000
										|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
								styles="width:100%;height:100%"
								sorting="T"/>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>

</table>
<gw:grid
	id="grd_day"
	header="day_name"
	format="0"
	aligns="0"
	defaults=""
	editcol="0"
	widths="1500"
	styles="display:none"
/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="txtCloseOpen" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtFlagClose_YN" styles="display:none"/>
<gw:textbox id="txtFrom" styles="display:none"/>
<gw:textbox id="txtTo" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtCompany_pk" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/>
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  /> 
<gw:textbox id="txtFlag" styles="display:none"/>  
<gw:list  id="lstSalaryPeriod" maxlen = "100" styles='width:100%;display:none' onchange="OnChangeTimes()" ></gw:list>
<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
</body>
</html>

