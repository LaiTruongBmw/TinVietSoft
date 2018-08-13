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
//"_PK|_Emp_Pk|Emp ID|Full Name|Organization|Shift|Day Type|Work Date|Date In|Time In|Date Out|Time Out|WT|OT|NT|ONT|Absence
//|ABS Time|Description|Mod By|Mod Date|WT Rate|OT Rate|NT Rate|ONT Rate|ABS Pay|ABS Rate"
var 
	G1_NO			= 0,
	G1_PK 			= 1,
	G1_EMP_PK 		= 2,
	G1_EMP_ID 		= 3,
	G1_FULL_NAME 	= 4,
	G1_ORGANIATION  = 5,
	G1_SHIFT 		= 6,
	G1_DAY_TYPE 	= 7,
	G1_WORK_DATE 	= 8,
	G1_DATE_IN 		= 9,
	G1_TIME_IN 		= 10,
	G1_DATE_OUT 	= 11,
	G1_TIME_OUT 	= 12,
	G1_WT 			= 13,
	G1_OT 			= 14,
	G1_NT 			= 15,
	G1_ONT			= 16,
	G1_ABSENCE_TYPE = 17,
	G1_ABSENCE_TIME = 18,
	G1_DESCRIPTION  = 19,
	G1_MOD_YN 		= 20,
	G1_MOD_BY_DATE  = 21,
	G1_WT_RATE  	= 22,
	G1_OT_RATE  	= 23,
	G1_NT_RATE  	= 24,
	G1_ONT_RATE 	= 25,
	G1_ABS_PAY_YN 	= 26,
	G1_ABS_RATE 	= 27;
 
function BodyInit()
{
    
    System.Translate_V2(document, System.Menu.GetMenuPS());	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";
    user= "<%=session("USER_NAME")%>";
    menu_id.text=System.Menu.GetMenuID();
    var tmp;
    tmp="<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0003' and a.code not in ('04','20','21') union SELECT NULL,'' FROM DUAL ") %>";
    grd_att.SetComboFormat(G1_ABSENCE_TYPE,tmp);

    tmp="<%=CtlLib.SetGridColumnDataSQL("select A.PK,A.SHIFT from THR_WORK_SHIFT A where a.del_if=0 AND A.USE_YN='Y' ORDER BY A.SHIFT ") %>";
    grd_att.SetComboFormat(G1_SHIFT, tmp);
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00700', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	ChangeColorItem(lstOrg.GetControl());
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('WSHIFT', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWS.SetDataText(data);
	lstWS.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	
//    FromDT.SetEnable(0);
//    ToDT.SetEnable(0);
//    Month.SetEnable(0);
    grd_att.GetGridControl().ColEditMask(G1_TIME_IN)="99:99";
    grd_att.GetGridControl().ColEditMask(G1_TIME_OUT)="99:99";
	
	grd_att.GetGridControl().ColHidden(G1_DATE_IN)=1;
	grd_att.GetGridControl().ColHidden(G1_DATE_OUT)=1;
	grd_att.GetGridControl().ColHidden(G1_WT_RATE)=1;
	grd_att.GetGridControl().ColHidden(G1_OT_RATE)=1;
	grd_att.GetGridControl().ColHidden(G1_NT_RATE)=1;
	grd_att.GetGridControl().ColHidden(G1_ONT_RATE)=1;
	grd_att.GetGridControl().ColHidden(G1_MOD_BY_DATE)=1;
	grd_att.GetGridControl().ColHidden(G1_ABS_PAY_YN)=1;
	grd_att.GetGridControl().ColHidden(G1_ABS_RATE)=1;
	
	rowset.style.display = 'none'; 
	
	var ctr = grd_att.GetGridControl(); 
    ctr.ColFormat(G1_WT) = "###.##";
    ctr.ColFormat(G1_OT) = "###.##"; 
	ctr.ColFormat(G1_NT) = "###.##"; 
	ctr.ColFormat(G1_ONT) = "###.##"; 
	ctr.ColFormat(G1_ABSENCE_TIME) = "###.##"; 
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

//------------------------------------------------------------------------------------
function OnUpdateDate()
{
	txtFrom.text=dtFromDate.value;
	txtTo.text=dtToDate.value;
}
function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
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

//------------------------------------------------------------------------------------
function onSetEnable(n)
{
      chkSelectAll.SetEnable(n);
      D_OUT.SetEnable(n);
      D_IN.SetEnable(n);
      ibtnSave.SetEnable(n);
      ibtnDelete.SetEnable(n);
}
function onSetEnable2(n)
{
      idHH.SetEnable(n);
      idMM1.SetEnable(n);
      idMM2.SetEnable(n);
      idBtnSet.SetEnable(n);
      idBtnClear.SetEnable(n);
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
        check_init = 1;
    }
	else if (obj.id == "datUser_info")
	{
		check_init = 1;
		ChangeColorItem(lstOrg.GetControl());
	}
    else if (obj.id == "data_hrti01600_0") 
	{
        idRecord.text = grd_att.rows - 1;
        auto_resize_column(grd_att, 0, grd_att.cols - 1, 0);
		for (var i = 1; i < grd_att.rows; i++) 
		{
			if (Trim(grd_att.GetGridData(i, G1_DAY_TYPE)) != "") 
			{
				if (Trim(grd_att.GetGridData(i, G1_DAY_TYPE)) == "Holiday") 
				{
					grd_att.SetCellBgColor(i, G1_WT, i, G1_WT, 0x3366FF);
					grd_att.SetCellBold(i, G1_WT, i, G1_WT, true);
				}
				else 
				{
					grd_att.SetCellBgColor(i, G1_WT, i, G1_WT, 0xCC9900);
					grd_att.SetCellBold(i, G1_WT, i, G1_WT, true);
				}
			}
		}
    }
	else if(obj.id =="pro_hrti01600_0")
	{
		data_hrti01600_0.Call("SELECT");
	}
    else if (obj.id == "datFind_Report") {
        var url = System.RootURL;
		txtReport_tmp.text = "/standard/reports/hr/ti/rpt_hrti01600_0.aspx";
        url = url + txtReport_tmp.text + '?p_user=' + user + '&p_ws=' + lstWS.value + '&p_search_temp=' + txtEmployee.text + '&p_tco_org_pk=' + lstOrg.value + '&p_from_date=' + dtFromDate.value + '&p_to_date=' + dtToDate.value + '&p_nation=' + lstNation.value ;
        window.open(url);
    }
    
   

}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------------------------------------------

/*function onClickOption(n)
{   
    opt_value=n;
    switch(n)
    {
        case 1:
            DailyDT.SetEnable(1);
            FromDT.SetEnable(0);
	        ToDT.SetEnable(0);
	        Month.SetEnable(0);
	        break;
	    case 2:
	        DailyDT.SetEnable(0);
            FromDT.SetEnable(1);
	        ToDT.SetEnable(1);
	        Month.SetEnable(0);
	        break;   
	    case 3:
	        DailyDT.SetEnable(0);
            FromDT.SetEnable(0);
	        ToDT.SetEnable(0);
	        Month.SetEnable(1);
	        break;        
    }
}
*/
function OnSearch()
{
/*	if(check_init==1)
	{
		switch(opt_value)
		{
			case 1:
			   txtFrom.text=DailyDT.value
			   txtTo.text=DailyDT.value
				break;
			case 2:
				txtFrom.text=FromDT.value
				txtTo.text=ToDT.value
				break;   
			case 3:
				txtFrom.text=Month.value+"01"
				txtTo.text=Month.value+"31"
				break;        
		}
*/		
		data_hrti01600_0.Call("SELECT");
		 
	
    
}
//------------------------------------------------------------------------------------
function OnUpdate()
{
    if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn muốn lưu dữ liệu?"))
        data_hrti01600_0.Call();
}

//-----------------------------------------------------------------------------------
function OnDelete()
{
	if(confirm((v_language =="ENG")?"Do you want to delete data?":"Bạn muốn xóa dữ liệu?"))
	{
		grd_att.DeleteRow();
		data_hrti01600_0.Call();
	}
}
function OnProcess()
{
	OnUpdateDate();
	var fpath = System.RootURL + "/standard/forms/hr/ti/hrti01603.aspx?org_pk=" + lstOrg.value +"&dt_from=" + txtFrom.text + "&dt_to=" + txtTo.text + "&emp_id=" + txtEmployee.text;
    var obj=System.OpenModal(fpath ,500, 400 ,  'resizable:yes;status:yes',this);
	  
}
//------------------------------------------------------------------------------------
function OnSelectAll(obj_checkbox,obj_grd)
{	
    var ctrl=obj_grd.GetGridControl();
    if( obj_checkbox.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
            ctrl.IsSelected(i)="True";
    }
	else
	{
        for(var i=1;i<ctrl.rows;i++)
            ctrl.IsSelected(i)="False";
    }        

}
function On_click()
{
    var ws;
	dt_tmp = grd_att.GetGridData(event.row,event.col)//luu tru gia tri vua click
	
}

//---------------------------------------------------------------------------
function Popup()
{
    var col=event.col;
    var flag=0;
    if((col== G1_EMP_ID)||(col==G1_FULL_NAME))
    {
        var fpath = System.RootURL + "/standard/forms/hr/ti/hrti01601.aspx?work_dt=" + grd_att.GetGridData(event.row, G1_WORK_DATE) + "&dt1=" + grd_att.GetGridData(event.row, G1_DATE_IN)
        + "&dt2=" +grd_att.GetGridData(event.row,G1_DATE_OUT) + "&emp_id=" +grd_att.GetGridData(event.row,G1_EMP_ID);
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:50;dialogHeight:20;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        
    }
    else if(col==G1_ABSENCE_TYPE)
    {
        var fpath = System.RootURL + "/standard/forms/hr/ti/hrti01602.aspx?abs_code=" + grd_att.GetGridData(event.row, G1_ABSENCE_TYPE);
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:25;dialogLeft:200;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(obj[0]!=grd_att.GetGridData(event.row,G1_ABSENCE_TYPE))
            {
                grd_att.SetGridText(event.row,col,obj[0]);
                grd_att.SetCellBgColor(event.row, G1_ABSENCE_TYPE,event.row, G1_ABSENCE_TYPE, 0x3366FF );
                grd_att.SetCellBold(event.row,G1_ABSENCE_TYPE,event.row,G1_ABSENCE_TYPE,true);
                
            }
        }
           
    }

}
//---------------------------------------------------------------------------
function get_random(num)
{
    var ranNum= Math.floor(Math.random()*num);//tra ra so nguyen
    return ranNum;
}

//---------------------------------------------------
function Numbers(e) 
{ 
  //  var ctrl=idTEL.GetControl(); 
    var keynum; 
    var keychar; 
    var numcheck; 
    keynum =event.keyCode; 
        
    if(window.event) // IE 
    { 
      keynum = e.keyCode; 
    } 
    else if(e.which) // Netscape/Firefox/Opera 
    { 
      keynum = e.which; 
    } 
    keychar = String.fromCharCode(keynum); 
    numcheck = /\d/; 
    return numcheck.test(keychar); 
}

//---------------------------------
function OnReport()
{
/*    switch(opt_value)
    {
        case 1:
           txtFrom.text=DailyDT.value
           txtTo.text=DailyDT.value
	        break;
	    case 2:
	        txtFrom.text=FromDT.value
            txtTo.text=ToDT.value
	        break;   
	    case 3:
	        txtFrom.text=Month.value+"01"
            txtTo.text=Month.value+"31"
	        break;        
    }
 */  
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();                  
}

function On_AfterEdit()
{
	var tmpIN,tmpOUT,tmpDT,ws,temp;
	cIdx=event.col;
	if (cIdx==G1_TIME_IN)
	{
		tmpIN=grd_att.GetGridData(event.row,cIdx)
		if(tmpIN.length==0)
		{
			grd_att.SetGridText(event.row,cIdx,"")
		}
		if((tmpIN.length!=4)&&(tmpIN.length!=""))
		{
			alert((v_language =="ENG")?"Input In time is not correct type.(type: hh:mm)":"Kiểu giờ in nhập không đúng(hh:mm)")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		{
			alert((v_language =="ENG")?"Input In time(Hour) is not correct type.(00<= hh <= 23)":"Kiểu giờ in phải >=00 và <=23")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		{
			alert((v_language =="ENG")?"Input In time(Minute) is not correct type.(00<= hh < 59)":"Kiểu phút phải >=00 và <=59")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpIN.length>0)
		{
		    tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		    grd_att.SetGridText(event.row,cIdx,tmpIN)
		}
		// Set Columm WT khi edit
		if(tmpIN!=dt_tmp)
		{
		    grd_att.SetGridText(event.row,G1_WT,"")
		    grd_att.SetGridText(event.row,cIdx,tmpIN)
		}
	}
	if (cIdx==G1_TIME_OUT)
	{
	    tmpOUT = grd_att.GetGridData(event.row,cIdx)
	    
		if(tmpOUT.length==0)
		{
			grd_att.SetGridText(event.row,cIdx,"")
			//return;
		}
		if((tmpOUT.length!=4)&&(tmpOUT.length>0))
		{
			alert((v_language =="ENG")?"Input Out time is not correct type.(type: hh:mm)":"Kiểu giờ out không đúng(hh:mm)")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpOUT.substr(0,2))>=24)||(Number(tmpOUT.substr(0,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Hour) is not correct type.(00<= hh <= 23)":"Kiểu giờ out phải >=00 và <=23")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpOUT.substr(2,2))>=60)||(Number(tmpOUT.substr(2,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Minute) is not correct type.(00<= hh < 60)":"Kiểu phút phải >=00 và <=59")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpOUT.length>0)
		{
		    tmpOUT=tmpOUT.substr(0,2)+":"+tmpOUT.substr(2,2)
		    grd_att.SetGridText(event.row,cIdx,tmpOUT);
		}
	    // Set Columm WT khi edit
		if(tmpOUT!=dt_tmp)
		{
		    grd_att.SetGridText(event.row,G1_WT,"")
		    grd_att.SetGridText(event.row,cIdx,tmpOUT)
		}	
	    
	}		
	if (cIdx==G1_ABSENCE_TYPE)
	{
		tmpABS_Type = grd_att.GetGridData(event.row,cIdx)
		if(tmpABS_Type == "")
		{
			grd_att.SetGridText(event.row,G1_ABSENCE_TIME,'')
		}
	}
}

function OnToggle(n)
{
	if(n ==1)
	{	
		if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			grd_att.GetGridControl().ColHidden(G1_DATE_IN)=1;
	        grd_att.GetGridControl().ColHidden(G1_DATE_OUT)=1;
	        grd_att.GetGridControl().ColHidden(G1_WT_RATE)=1;
	        grd_att.GetGridControl().ColHidden(G1_OT_RATE)=1;
	        grd_att.GetGridControl().ColHidden(G1_NT_RATE)=1;
	        grd_att.GetGridControl().ColHidden(G1_ONT_RATE)=1;
	        grd_att.GetGridControl().ColHidden(G1_ABS_PAY_YN)=1;
	        grd_att.GetGridControl().ColHidden(G1_ABS_RATE)=1;
			grd_att.GetGridControl().ColHidden(G1_MOD_BY_DATE)=1;
			
			
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show Column";
        }
        else
        {
			grd_att.GetGridControl().ColHidden(G1_DATE_IN)=0;
	        grd_att.GetGridControl().ColHidden(G1_DATE_OUT)=0;
	        grd_att.GetGridControl().ColHidden(G1_WT_RATE)=0;
	        grd_att.GetGridControl().ColHidden(G1_OT_RATE)=0;
	        grd_att.GetGridControl().ColHidden(G1_NT_RATE)=0;
	        grd_att.GetGridControl().ColHidden(G1_ONT_RATE)=0;
	        grd_att.GetGridControl().ColHidden(G1_ABS_PAY_YN)=0;
	        grd_att.GetGridControl().ColHidden(G1_ABS_RATE)=0;
			grd_att.GetGridControl().ColHidden(G1_MOD_BY_DATE)=0;
			
            imgMaster.status = "expand";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Hide Column";
        }
	}
	else
	{
		if(imgMaster2.status == "expand")
        {
            imgMaster2.status = "collapse";
			grd_att.GetGridControl().ColHidden(G1_DATE_IN)=1;
	        rowset.style.display = 'none'; 
			
            imgMaster2.src = "../../../../system/images/iconmaximize.gif";
			imgMaster2.alt="Show Set Row";
        }
        else
        {
			rowset.style.display = '';
	        
			
            imgMaster2.status = "expand";
            imgMaster2.src = "../../../../system/images/close_popup.gif";
			imgMaster2.alt="Hide Set Row";
        }
	}
}
function change_list()
{
    if(idLstInOut.value=="0")
    {
        onSetEnable2(0);   
        return;
    }
	if((idLstInOut.value=="1")||(idLstInOut.value=="2"))
	{
   		idMM1.style.display   = '';
		idMM2.style.display   = '';
		idlbHH.text="HH"
		idlbMM1.text="MM1"
		idlbMM2.text="MM2"
		

	}
	else
	{
		idMM1.style.display   = 'none';
		idMM2.style.display   = 'none';
		idlbHH.text="H"
		idlbMM1.text=""
		idlbMM2.text=""
		
	}
	if(grd_att.rows>1)
	{
	    onSetEnable2(1);
	    idHH.GetControl().focus();
	}    
	    
	
}
function OnSetToGrid()
{
	var gCtrl,i;
	var input_time,hh,mm1,mm2
	var mm_tmp, ran_var,result
	gCtrl=grd_att.GetGridControl();		
	mm1=Trim(idMM1.text);
	mm2=Trim(idMM2.text);
	hh=Trim(idHH.text);

	if(gCtrl.rows>1)
	{
		if(gCtrl.SelectedRows<=1)
		{
			if(confirm("Set to all blank records (not include holiday)?\nĐiền vào tất cả những dòng còn trống (không kể ngày nghỉ)?"))
			{
					for(i=1;i<gCtrl.rows;i++)
					{		
						if((Number(mm1)>=0)&&(Number(mm1)<60)&&(Number(mm2)>=0)&&(Number(mm2)<60)&&(Number(hh)>=0)&&(Number(hh)<=23)&&(Number(mm1)<Number(mm2))
							&&(mm1.length==2)&&(mm2.length==2)&&(hh.length==2))
						{
							mm_tmp=Number(mm2)-Number(mm1);
							ran_var=get_random(mm_tmp)+Number(mm1);
							if(Number(ran_var)<10)
								ran_var="0"+ran_var;
							result=hh+":"+ran_var;
							if (idLstInOut.value=="1") //in
							{
								if (grd_att.GetGridData(i,G1_TIME_IN)=="")
								{
								   grd_att.SetGridText(i,G1_TIME_IN,result);
								   grd_att.SetGridText(i,G1_WT,"");
								   grd_att.SetGridText(i,G1_WT_RATE,"");
									
								}
							}
							if (idLstInOut.value=="2") //out
							{
								
								if (grd_att.GetGridData(i,G1_TIME_OUT)=="")
								{
									
								   grd_att.SetGridText(i,G1_TIME_OUT,result);
								   grd_att.SetGridText(i,G1_WT,"");
								   grd_att.SetGridText(i,G1_WT_RATE,"");
									
								}
							}
						}							
						else if (idLstInOut.value=="3")
						  {      
								grd_att.SetGridText(i,G1_WT,Trim(idHH.text));
						  }	    
						else if (idLstInOut.value=="4")
						{
								grd_att.SetGridText(i,G1_OT,Trim(idHH.text));
						}		
						else if (idLstInOut.value=="5")
						{
								grd_att.SetGridText(i,G1_NT,Trim(idHH.text));
						}
						else if (idLstInOut.value=="7") //ONT
						{
								grd_att.SetGridText(i,G1_ONT,Trim(idHH.text));
						}		
						else
						{
							alert("Incorrect type of time.(HH:00->24),(mm1,mm2: 00->60), pld try again\nKiểu giờ bạn nhập không đúng, hãy nhập lại?")
							return;
						}
					}
				}
			}
		else
		{			
			for(i=0;i<gCtrl.SelectedRows;i++)
			{
				var row=gCtrl.SelectedRow(i);	
				
				if((Number(mm1)>=0)&&(Number(mm1)<60)&&(Number(mm2)>=0)&&(Number(mm2)<60)&&(Number(hh)>=0)&&(Number(hh)<=23)&&(Number(mm1)<Number(mm2))
					&&(mm1.length==2)&&(mm2.length==2)&&(hh.length==2))
				{
					mm_tmp=Number(mm2)-Number(mm1)
					ran_var=get_random(mm_tmp)+Number(mm1)
					if(Number(ran_var)<10)
						ran_var="0"+ran_var
					result=hh+":"+ran_var
					
					if (idLstInOut.value=="1") //in
					{
						if (grd_att.GetGridData(row,G1_TIME_IN)=="")
						{
						   grd_att.SetGridText(row,G1_TIME_IN,result);
						   grd_att.SetGridText(row,G1_WT,"");
						   grd_att.SetGridText(row,G1_WT_RATE,"");
							
						}
					}
					if (idLstInOut.value=="2") //out
					{
						if (grd_att.GetGridData(row,G1_TIME_OUT)=="")
						{
						   grd_att.SetGridText(row,G1_TIME_OUT,result);
						   grd_att.SetGridText(row,G1_WT,"");
						   grd_att.SetGridText(row,G1_WT_RATE,"");
							
						}
					}
					
				}
				else if (idLstInOut.value=="3")
				{      
						grd_att.SetGridText(row,G1_WT,Trim(idHH.text));
				}	    
				else if (idLstInOut.value=="4")
				{
						grd_att.SetGridText(row,G1_OT,Trim(idHH.text));
				}		
				else if (idLstInOut.value=="5")
				{
						grd_att.SetGridText(row,G1_NT,Trim(idHH.text));
				}
				else if (idLstInOut.value=="7") //ONT
				{
						grd_att.SetGridText(row,G1_ONT,Trim(idHH.text));
				}	
				else
				{
					alert("Incorrect type of time.(HH:00->24),(mm1,mm2: 00->60), please try again\nKiểu giờ bạn nhập không đúng, hãy nhập lại?");
					return;
				}
				
			}
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
//-------------------------------------------------------------
function onClearGrid()
{
	var ctrl,i
	ctrl=grd_att.GetGridControl();
	if(ctrl.SelectedRows<=1)
	{
		if(confirm("Set to all blank records"))
		{
			switch(idLstInOut.value)
			{
				case "1": //in
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_TIME_IN,"")
					}	
				break;
				case "2": //out
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_TIME_OUT,"")
					}	
				break;
				case "3": //wt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_WT,"")
					}	
				break;
				case "4": //ot
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_OT,"")					
					}	
				break;
				case "5": //nt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_NT,"")
					}	
				break;
				case "7": //nt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,G1_ONT,"")
					}	
				break;
				
			}
		}
	}
	else
	{
		for(i=0;i<ctrl.SelectedRows;i++)
		{
			var tmp=ctrl.SelectedRow(i);	
			switch(idLstInOut.value)
			{
				case "1":
					grd_att.SetGridText(tmp,G1_TIME_IN,"")
				break;
				case "2":
					grd_att.SetGridText(tmp,G1_TIME_OUT,"")
				break;
				case "3":
					grd_att.SetGridText(tmp,G1_WT,"")
				break;
				case "4":
					grd_att.SetGridText(tmp,G1_OT,"")
				break;
				case "5":
					grd_att.SetGridText(tmp,G1_NT,"")
				break;
				case "7":
					grd_att.SetGridText(tmp,G1_ONT,"")
				break;
				
			}
		}
	}
}
function OnAfter_Sort()
{
	for(i=1; i<grd_att.rows; i++)
	{
		grd_att.SetGridText(i, G1_NO, i);
	}
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
<gw:data id="data_hrti01600_0" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" 
				function="ST_HR_SEL_hrti01600_0" procedure="ST_HR_UPD_hrti01600_0"> 
                <input bind="grd_att" >
					<input bind="txtEmployee" />
					<input bind="dtFromDate" />
                    <input bind="dtToDate" />
                    <input bind="lstOrg" />
                    <input bind="lstWS" />
                    <input bind="lstNation" />
                </input>
                <output  bind="grd_att" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
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
<table style="width:100%;height:100%" cellpadding="0" border="0" cellspacing="0" align="top" >   
    <tr style="width:100%;height:100%" valign="top">
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:8%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>	
						<table width="100%"  style="height:100%"  cellpadding="2" cellspacing="1">
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >						
								</td>					
								<td colspan=12 width="12%" style="border:0" align="left" >Employee</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:textbox id="txtEmployee" maxlen = "20" styles="width:100%" onenterkey="OnSearch()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 style="border:0" width="12%" align="left" >
									Shift
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstWS"  maxlen = "100" styles='width:100%' />
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
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" align="left"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="right" >
									<gw:list  id="lstOrg"  maxlen = "100" styles='width:100%'  />
								</td>
								<td colspan=2 width="2%"  align="right"  >
									
								</td>
								<td colspan=12  width="12%" align="left" >
									<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
								</td>
								<td colspan=20 width="20%"  align="left" >
									<gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
									~
									<gw:datebox id="dtToDate"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
								</td>
							</tr>
							<tr id="rowset" style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" align="left"   >									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									<font color="FF3399">Set value</font>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:list id="idLstInOut"  styles="width:100%" value="0" onchange="change_list()"><data>|0|Choose...|1|Random Time In|2|Random Time Out|9|Date In|10|Date Out|3|WT|4|OT|5|NT|7|ONT|11|ABS Type|12|ASB Time</data></gw:list >
								</td>
								<td colspan=2 width="2%" align="left"   >									
								</td>
								<td colspan=12 width="12%" style="border:0" align="left" >
									<gw:label id="idlbHH" styles="width:100%">HH</gw:label>
								</td>
								<td colspan=20 width="20%" style="border:0"  >
									<gw:textbox id="idHH" maxlen = "5" styles="width:100%" onkeypress="" />
								</td>
								<td colspan=14 style="border:0" width="14%" align="right" >
									<gw:label id="idlbMM1" styles="width:100%">MM1</gw:label>
								</td>
								<td colspan=5 width="5%" style="border:0"  align="right" >
									<gw:textbox id="idMM1" maxlen = "2" styles="width:100%"  onkeypress="return Numbers(event)"/>
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									<gw:label id="idlbMM2" styles="width:100%">MM2</gw:label>
								</td>
								<td colspan=5 width="5%" style="border:0"  align="right" >
									<gw:textbox id="idMM2"	maxlen = "2" styles="width:100%" onkeypress="return Numbers(event)" />
								</td>
								<td colspan=4 width="4%" style="border:0"   >
									<gw:icon id="idBtnSet"  styles='width:90%' img="in"  text="Set"  onclick="OnSetToGrid()"/>
								</td>
								<td colspan=4 width="4%" style="border:0" >
									<gw:icon id="idBtnClear"  styles='width:90%' img="in"  text="Clear"  onclick="onClearGrid()"/>
								</td>
								<td colspan=5 width="5%" style="border:0" >									
								</td>								
								<td colspan=10 width="10%" style="border:0" align="left" >									
								</td>								
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%"  align="right"  >
							
						</td>
						<td colspan=5 width="5%" style="border:0" align="center" >
							Rows: 
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:label id="idRecord" text="" ></gw:label>
						</td>
						<td colspan=61 width="61%" style="border:0" align="left" >
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnSearch" img="search" text="Search" onclick="OnSearch()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnSave" img="save" text="Save" onclick="OnUpdate()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnReport()" />
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnProcess" img="process" text="Process" onclick="OnProcess()" />
						</td>
				
						<td colspan=1 width="1%" style="border:0"   >
							<img status="collapse" id="imgMaster" alt="Show Column" src="../../../../system/images/iconmaximize.gif" style="cursor:hand;position:absolute;" onclick="OnToggle(1)"  />
						</td>
						<td colspan=1 width="1%"  style="border:0"   >
							<img status="collapse" id="imgMaster2" alt="Show Set Row" src="../../../../system/images/iconmaximize.gif" style="cursor:hand;position:absolute;" onclick="OnToggle(2)"  />
						</td>
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:88%" >
				<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
					<tr valign="top">
						<td width="100%" height="100%">	
							<gw:grid
								id="grd_att"
								header="No|_PK|_Emp_Pk|Emp ID|Full Name|Organization|Shift|Day Type|Work Date|Date In|Time In|Date Out|Time Out|WT|OT|NT|ONT|ABS Type|ABS Time|Description|Mod Y/N|Mod By/Date|WT Rate(%)|OT Rate(%)|NT Rate(%)|ONT Rate(%)|ABS Pay|ABS Rate(%)"
								format="0|0|0|0|0|0|0|0|4|4|0|4|0|-0|-0|-0|-0|0|-0|0|0|0|-0|-0|-0|-0|0|-0"
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0"
								defaults="|||||||||||||||||||||||||||"
								editcol="0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0"
								widths="500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"
								styles="width:100%;height:100%"
								onafteredit="On_AfterEdit()"
								oncelldblclick = "Popup()"
								onentercell = "On_click()"
								onaftersort = "OnAfter_Sort()"
								sorting="T"/>
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
<gw:textbox id="txtReport_tmp" styles="display:none"/> 
<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
</body>
</html>

