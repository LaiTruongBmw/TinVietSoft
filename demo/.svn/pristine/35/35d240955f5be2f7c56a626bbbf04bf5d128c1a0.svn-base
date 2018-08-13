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

var c_emp_pk=0;
 c_org = 1
 c_wg = 2
 c_emp_id = 3,
 c_fullname = 4,
 c_ws = 5,
 c_date_in = 6,
 c_n1 = 7,
 c_in_time = 8,
 c_date_out = 9,
 c_n2 = 10,
 c_out_time = 11,
 c_wt = 12,
 c_ot = 13,
 c_nt = 14,
 c_nt2 = 15,
 c_nt3 = 16,
 c_ht = 17,
 c_abs_code = 18,
 c_abs_hour = 19,
 c_ale = 20,
 c_wkd_pk = 21,
 c_ot_pk = 22,
 c_abs_pk = 23,
 c_work_dt = 24,
 c_work_group2 = 25,
 c_nt_pk = 26,
 c_ht_pk = 27,
 c_date_now = 28,
c_date_next = 29,
 c_hol_type = 30,
 c_mod_by_hand = 31,
 c_no_scan = 32,
 c_status = 33,
 nt2_pk = 34,
 nt3_pk = 35,
 c_ot_plus = 36,
 c_close = 37,
 c_note_att = 38,
 c_temp_out = 39,
 c_temp_in = 40,
 c_temp_out2 = 41,
 c_temp_in2 = 42,
 c_temp_wt = 43,
 c_temp_ot = 44,
 c_temp_nt = 45,
 c_temp_nt2 = 46,
 c_temp_nt3 = 47,
 c_temp_ht = 48,
 c_confirm = 49;
 
function BodyInit()
{
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text="<%=Session("COMPANY_PK")%>";
    user= "<%=session("USER_NAME")%>";
    menu_id.text=System.Menu.GetMenuID();
    var tmp;
    tmp="<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0003' and a.code<>'04' union SELECT NULL,'' FROM DUAL ") %>";
    grd_att.SetComboFormat(c_abs_code,tmp);

    tmp="<%=CtlLib.SetGridColumnDataSQL("select A.PK,A.SHIFT from THR_WORK_SHIFT A where a.del_if=0 AND A.USE_YN='Y' ORDER BY A.SHIFT ") %>";
    grd_att.SetComboFormat(c_ws, tmp);
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
	
	if(v_language == "ENG")
		data ="|0|Choose to set|1|Random In time|2|Random Out time|3|WT|4|OT|5|NT|7|NT2|8|NT3|6|HT";
	else
		data ="|0|Chọn ấn định|1|Giờ ra ngẫu nhiên|2|Giờ vào ngẫu nhiên|3|Giờ làm|4|Giờ tăng ca|5|HTCĐ|7|HTTCĐ|8|HTTCĐ2|6|Giờ lễ";
	idLstInOut.SetDataText(data);
	idLstInOut.value = "0";
   
    lstWG.value="ALL";
    FromDT.SetEnable(0);
    ToDT.SetEnable(0);
    Month.SetEnable(0);
    grd_att.GetGridControl().ColEditMask(c_in_time)="99:99";
    grd_att.GetGridControl().ColEditMask(c_out_time)="99:99";	
    grd_att.GetGridControl().ColEditMask(c_temp_out)="99:99";
    grd_att.GetGridControl().ColEditMask(c_temp_in)="99:99";	
    grd_att.GetGridControl().ColEditMask(c_temp_out2)="99:99";
    grd_att.GetGridControl().ColEditMask(c_temp_in2)="99:99";	
    grd_att.GetGridControl().FrozenCols =5;
    grd_att.GetGridControl().ScrollTrack=true;
    onSetEnable(0);
    onSetEnable2(0);
	  
    grd_att.GetGridControl().ColHidden(c_date_in)=1;
    grd_att.GetGridControl().ColHidden(c_n1)=1;
    grd_att.GetGridControl().ColHidden(c_date_out)=1;
    grd_att.GetGridControl().ColHidden(c_n2)=1;

    idlbN1.style.display   = 'none';
    D_IN.style.display   = 'none';
    idlbN2.style.display   = 'none';
    D_OUT.style.display   = 'none';

    grd_att.GetGridControl().ColHidden(c_temp_out)=1;
    grd_att.GetGridControl().ColHidden(c_temp_in)=1;
    grd_att.GetGridControl().ColHidden(c_temp_out2)=1;
    grd_att.GetGridControl().ColHidden(c_temp_in2)=1;
    grd_att.GetGridControl().ColHidden(c_temp_wt)=1;
    grd_att.GetGridControl().ColHidden(c_temp_ot)=1;
    grd_att.GetGridControl().ColHidden(c_temp_nt)=1;
    grd_att.GetGridControl().ColHidden(c_temp_nt2) = 1;
    grd_att.GetGridControl().ColHidden(c_temp_nt3) = 1;
    grd_att.GetGridControl().ColHidden(c_temp_ht)=1;
			
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
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}
//------------------------------------------------------------------------------------

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
//------------------------------------------------------------------------------------

/*function OnShowPopup()
{
        var fpath = System.RootURL + "/form/ch/ae/chae00010_dept.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:60;dialogTop:200;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
             txtUpperDept.text=obj;
             datDeptData.Call();
        }
}
*/
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
function OnDataReceive(obj) {
    if (obj.id == "datCheck_View") {
        if (txtFlag_View.text == 'Y') {
            ibtnSave.style.display = "none";
            ibtnDelete.style.display = "none";
        }

        if ((Trim(iduser_pk.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
        {
            datUser_info.Call();
        }
        check_init = 1;
    }
    else if (obj.id == "datAttendence_absence") {
        clear_Interval(idInterval);
        idRecord.text = grd_att.rows - 1;
        if (grd_att.rows > 1) {
            var wt, ot, nt, ht, abs;
            wt = ot = nt = ht = abs = 0;
            onSetEnable(1);
            if (idLstInOut.value != "0")
                onSetEnable2(1);
            for (var i = 1; i < grd_att.rows; i++) {
                if (grd_att.GetGridData(i, c_close) == "M")
                    grd_att.SetCellBgColor(i, c_emp_pk, i, c_close, 0x99FFFF);
                if (grd_att.GetGridData(i, c_close) == "Y")
                    grd_att.SetCellBgColor(i, c_emp_pk, i, c_close, 0xFFEEFF);


                if (Trim(grd_att.GetGridData(i, c_hol_type)) != "") {
                    if (Trim(grd_att.GetGridData(i, c_hol_type)) == "HOL") {
                        grd_att.SetCellBgColor(i, c_ht, i, c_ht, 0x3366FF);
                        grd_att.SetCellBold(i, c_ht, i, c_ht, true);
                    }
                    else {
                        grd_att.SetCellBgColor(i, c_ht, i, c_ht, 0xCC9900);
                        grd_att.SetCellBold(i, c_ht, i, c_ht, true);
                    }
                }
                if (grd_att.GetGridData(i, c_date_in) != grd_att.GetGridData(i, c_date_now))
                    grd_att.SetGridText(i, c_n1, '-1');
                if (grd_att.GetGridData(i, c_date_out) != grd_att.GetGridData(i, c_date_now))
                    grd_att.SetGridText(i, c_n2, '-1');
                if (Trim(grd_att.GetGridData(i, c_wt)) == "" ? wt += 0 : wt += Number(grd_att.GetGridData(i, c_wt)));
                if (Trim(grd_att.GetGridData(i, c_ot)) == "" ? ot += 0 : ot += Number(grd_att.GetGridData(i, c_ot)));
                if (Trim(grd_att.GetGridData(i, c_nt)) == "" ? nt += 0 : nt += Number(grd_att.GetGridData(i, c_nt)));

                if (Trim(grd_att.GetGridData(i, c_ht)) == "" ? ht += 0 : ht += Number(grd_att.GetGridData(i, c_ht)));
                if (Trim(grd_att.GetGridData(i, c_abs_hour)) == "" ? abs += 0 : abs += Number(grd_att.GetGridData(i, c_abs_hour)));

            }
            idlbWtOtNtHt.text = "WT: " + Math.round(wt) + "(H)." + "OT:" + ot + "(H). " + " NT: " + nt + "(H). " + " Absence: " + abs + "(H).";
        }
        else {
            onSetEnable(0);
            onSetEnable2(0);
            idlbWtOtNtHt.text = "";
        }
        auto_resize_column(grd_att, 0, grd_att.cols - 1, 0);

    }
    else if (obj.id == "datFind_Report") {
        var url = System.RootURL;
        url = url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG.value + '&p_search_temp=' + idtxtTmp.text + '&p_tco_org_pk=' + lstOrg.value + '&p_from_date=' + txtFrom.text + '&p_to_date=' + txtTo.text + '&p_work_shift=' + lstWS.value + '&p_date_type=' + opt_value + '&p_nation=' + lstNation.value + '&p_reg=' + lstReg.value + '&p_com=' + txtCompany_pk.text + '&p_data_type=' + idPrint_type.value + '&p_confirm=' + idConfirm.value;
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

function onClickOption(n)
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
//------------------------------------------------------------------------------------

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
//------------------------------------------------------------------------------------

function On_AfterEdit()
{
	var tmpIN,tmpOUT,tmpDT,ws,temp;
	cIdx=event.col;
	ws=grd_att.GetGridData(event.row,c_ws)
	lstWS_temp.value=ws;
	idlbWS.text=lstWS_temp.GetText();

    


	if (cIdx==c_in_time)
	{
	    tmpIN=grd_att.GetGridData(event.row,cIdx)	    
		if(tmpIN.length==0)
		{
			grd_att.SetGridText(event.row,cIdx,"")
			//return;
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
		    grd_att.SetGridText(event.row,c_wt,"")
		    grd_att.SetGridText(event.row,cIdx,tmpIN)
		}
		
	}
	if (cIdx==c_out_time)
	{
	    tmpOUT=grd_att.GetGridData(event.row,cIdx)
	    
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
		    grd_att.SetGridText(event.row,c_wt,"")
		    grd_att.SetGridText(event.row,cIdx,tmpOUT)
		}	
	    
		
	}		
	if ((cIdx==c_date_in)||(cIdx==c_date_out)) //date in out
	{
		tmpDT=grd_att.GetGridData(event.row,cIdx)
		if(Number(tmpDT)<Number(grd_att.GetGridData(event.row,c_date_now))-1||Number(tmpDT)>Number(grd_att.GetGridData(event.row,c_date_now))+1)
		{
		    if(!confirm((v_language =="ENG")?"You choose date maybe not correct, Do you want to keep?":"Bạn đã chọn ngày không hợp lệ, Bạn chắc chắn?"))
		        grd_att.SetGridText(event.row,cIdx,dt_tmp);
		}   
	}		
	if (cIdx==c_abs_code||cIdx==c_ws) //ABS
	{
	    if(grd_att.GetGridData(event.row,cIdx)=="")
	    {
	        grd_att.SetCellBgColor(event.row, cIdx,event.row, cIdx, 0x000000);
            grd_att.SetCellBold(event.row,cIdx,event.row,cIdx,false);
	    }
	    else if(dt_tmp!=grd_att.GetGridData(event.row,cIdx))
	    {
         grd_att.SetCellBgColor(event.row, cIdx,event.row, cIdx, 0x3366FF );
         grd_att.SetCellBold(event.row,cIdx,event.row,cIdx,true);
        }
    }     
    if (cIdx==c_wt) //WT      
    {
        if(Number(grd_att.GetGridData(event.row,cIdx))>0&&grd_att.GetGridData(event.row,c_hol_type)!="")
        {
            alert((v_language =="ENG")?"This day is holiday, haven't WT.":"Ngày này là ngày nghỉ không thể có giờ làm việc chính thức.")
            grd_att.SetGridText(event.row,cIdx,'0');
        }
    }
    //chkSelectAll.value='F';
	if(cIdx==c_n1)
	{
	    if(grd_att.GetGridData(event.row,c_n1)==0)
	    {   
	        temp=grd_att.GetGridData(event.row,c_date_now)
	        grd_att.SetGridText(event.row,c_date_in,temp)
	    }
	    else    
	    {
	        temp=grd_att.GetGridData(event.row,c_date_next)
	        grd_att.SetGridText(event.row,c_date_in,temp)
	    }
	}
	else if(cIdx==c_n2)
	{
	    if(grd_att.GetGridData(event.row,c_n2)==0)
	    {   
	        temp=grd_att.GetGridData(event.row,c_date_now)
	        grd_att.SetGridText(event.row,c_date_out,temp)
	    }
	    else    
	    {
	        temp=grd_att.GetGridData(event.row,c_date_next)
	        grd_att.SetGridText(event.row,c_date_out,temp)
	    }
	}
    if (cIdx==c_temp_out) //cot temp out
	{
	    tmpOUT=grd_att.GetGridData(event.row,cIdx)
	    
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
		    grd_att.SetGridText(event.row,c_temp_wt,"")
            grd_att.SetGridText(event.row,c_wt,"") //SET COT WT DE TINH TU DONG
		    grd_att.SetGridText(event.row,cIdx,tmpOUT)
		}	
	}
    if (cIdx==c_temp_in) //cot temp out
	{
	    tmpIN=grd_att.GetGridData(event.row,cIdx)
	    
		if(tmpIN.length==0)
		{
			grd_att.SetGridText(event.row,cIdx,"")
			//return;
		}
		if((tmpIN.length!=4)&&(tmpIN.length>0))
		{
			alert((v_language =="ENG")?"Input Out time is not correct type.(type: hh:mm)":"Kiểu giờ out không đúng(hh:mm)")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Hour) is not correct type.(00<= hh <= 23)":"Kiểu giờ out phải >=00 và <=23")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Minute) is not correct type.(00<= hh < 60)":"Kiểu phút phải >=00 và <=59")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpIN.length>0)
		{
		    tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		    grd_att.SetGridText(event.row,cIdx,tmpIN);
		}
	    // Set Columm WT khi edit
		if(tmpIN!=dt_tmp)
		{
		    grd_att.SetGridText(event.row,c_temp_wt,"")
            grd_att.SetGridText(event.row,c_wt,"") //SET COT WT DE TINH TU DONG
		    grd_att.SetGridText(event.row,cIdx,tmpIN)
		}	
	}

    if (cIdx==c_temp_out2) //cot temp out2
	{
        if(grd_att.GetGridData(event.row,c_temp_out)=="" || grd_att.GetGridData(event.row,c_temp_in)=="")
        {
            alert((v_language =="ENG")?"You must input temp in/out first":"Vui lòng nhập temp in/out trước");
            grd_att.SetGridText(event.row,cIdx,"")
            return;
        }

	    tmpOUT=grd_att.GetGridData(event.row,cIdx)
	    
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
		    grd_att.SetGridText(event.row,c_temp_wt,"")
            grd_att.SetGridText(event.row,c_wt,"") //SET COT WT DE TINH TU DONG
		    grd_att.SetGridText(event.row,cIdx,tmpOUT)
		}	
	}

    if (cIdx==c_temp_in2) //cot temp out2
	{
        if(grd_att.GetGridData(event.row,c_temp_out)=="" || grd_att.GetGridData(event.row,c_temp_in)=="")
        {
            alert((v_language =="ENG")?"You must input temp in/out first":"Vui lòng nhập temp in/out trước");
            grd_att.SetGridText(event.row,cIdx,"")
            return;
        }

	    tmpIN=grd_att.GetGridData(event.row,cIdx)
	    
		if(tmpIN.length==0)
		{
			grd_att.SetGridText(event.row,cIdx,"")
			//return;
		}
		if((tmpIN.length!=4)&&(tmpIN.length>0))
		{
			alert((v_language =="ENG")?"Input Out time is not correct type.(type: hh:mm)":"Kiểu giờ out không đúng(hh:mm)")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Hour) is not correct type.(00<= hh <= 23)":"Kiểu giờ out phải >=00 và <=23")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		{
			alert((v_language =="ENG")?"Input Out time(Minute) is not correct type.(00<= hh < 60)":"Kiểu phút phải >=00 và <=59")
			grd_att.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpIN.length>0)
		{
		    tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		    grd_att.SetGridText(event.row,cIdx,tmpIN);
		}
	    // Set Columm WT khi edit
		if(tmpIN!=dt_tmp)
		{
		    grd_att.SetGridText(event.row,c_temp_wt,"")
            grd_att.SetGridText(event.row,c_wt,"") //SET COT WT DE TINH TU DONG
		    grd_att.SetGridText(event.row,cIdx,tmpIN)
		}	
	}


    if(dt_tmp!=grd_att.GetGridData(event.row,cIdx) )
	{
	    if (cIdx == c_abs_code || cIdx == c_abs_hour || cIdx == c_no_scan || cIdx == c_ot_plus  || cIdx == c_note_att)
	    {
	        if (grd_att.GetGridData(event.row,c_status)!="1" )
	            grd_att.SetGridText(event.row,c_status,"2");  //ghi nhan sua ve ben vang
	    }
	    else
	        grd_att.SetGridText(event.row,c_status,"1"); //ghi nhan sua ve ben cong
	}    
	
	

     if((grd_att.GetGridData(event.row,c_status)=="1" || grd_att.GetGridData(event.row,c_status)=="2" ) && (grd_att.GetGridData(event.row,c_close)=="M"||grd_att.GetGridData(event.row,c_close)=="Y" ||grd_att.GetGridData(event.row,c_confirm)=="Y") )
	  {
        alert((v_language =="ENG")?"You can't modify and save this record because this data was closed or confirmed!":"Bạn không thể điều chỉnh và lưu thông tin của dòng dữ liệu này vì dữ liệu đã đóng! ") ;
        grd_att.SetGridText(event.row,cIdx,dt_tmp);
	    grd_att.SetGridText(event.row,c_status,"");
	    return;
	  }



}
//------------------------------------------------------------------------------------

function OnSearch()
{
	if(check_init==1)
	{
		clear_Interval(idInterval);
		 /*var arr = txt_WS_temp.text.replace("DATA|",'').split("|");
		   var s="";
		   var t=0;
			   for(var i=0;i< (arr.length+1)/2-1;i++)
				{
					s = s +"#" + arr[t] + ";" + arr[t+1].split('-')[0]+"|";
					t=t+2;
				}
				grd_att.SetComboFormat(c_ws,s  );*/
		
		
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
		if((opt_value!=1)&&(lstOrg.value=="ALL")&&(lstWG.value=="ALL")&&(idtxtTmp.text==""))
		{
			if(confirm((v_language =="ENG")?"It will take long time because you get overload data, do you want to continous?":"Hệ thống dự báo dữ liệu quá nhiều bạn sẽ phải đợi trong 1 thời gian dài, bạn có muốn tiếp tục?"))
			{
				set_Interval(100);
				datAttendence_absence.Call("SELECT");
			}    
		}   
		else 
		{
			set_Interval(100);
			datAttendence_absence.Call("SELECT");
		}   
	}	
    
}
//------------------------------------------------------------------------------------
function OnUpdate()
{
    if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn muốn lưu dữ liệu?"))
        datAttendence_absence.Call();
}
//------------------------------------------------
function OnToggle(n)
{
    if(n==1)
    {
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			grd_att.GetGridControl().ColHidden(c_date_in)=1;
	        grd_att.GetGridControl().ColHidden(c_n1)=1;
	        grd_att.GetGridControl().ColHidden(c_date_out)=1;
	        grd_att.GetGridControl().ColHidden(c_n2)=1;
			idlbN1.style.display   = 'none';
			D_IN.style.display   = 'none';
			idlbN2.style.display   = 'none';
			D_OUT.style.display   = 'none';
			
			
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show Column";
        }
        else
        {
			grd_att.GetGridControl().ColHidden(c_date_in)=0;
	        grd_att.GetGridControl().ColHidden(c_n1)=0;
	        grd_att.GetGridControl().ColHidden(c_date_out)=0;
	        grd_att.GetGridControl().ColHidden(c_n2)=0;
		    idlbN1.style.display   = '';
			D_IN.style.display   = '';
			idlbN2.style.display   = '';
			D_OUT.style.display   = '';	
            imgMaster.status = "expand";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Hide Column";
        }
    }
    if(n==2)
    {
        if(img_temp.status == "expand")
        {


            img_temp.status = "collapse";
			grd_att.GetGridControl().ColHidden(c_temp_out)=1;
	        grd_att.GetGridControl().ColHidden(c_temp_in)=1;
	        grd_att.GetGridControl().ColHidden(c_temp_out2)=1;
	        grd_att.GetGridControl().ColHidden(c_temp_in2)=1;
            grd_att.GetGridControl().ColHidden(c_temp_wt)=1;
            grd_att.GetGridControl().ColHidden(c_temp_ot)=1;
            grd_att.GetGridControl().ColHidden(c_temp_nt)=1;
            grd_att.GetGridControl().ColHidden(c_temp_nt2)=1;
            grd_att.GetGridControl().ColHidden(c_temp_nt3)=1;
            grd_att.GetGridControl().ColHidden(c_temp_ht)=1;
			
            img_temp.src = "../../../../system/images/iconmaximize.gif";
			img_temp.alt="Show Column";
        }
        else
        {
			grd_att.GetGridControl().ColHidden(c_temp_out)=0;
	        grd_att.GetGridControl().ColHidden(c_temp_in)=0;
	        grd_att.GetGridControl().ColHidden(c_temp_out2)=0;
	        grd_att.GetGridControl().ColHidden(c_temp_in2)=0;
            grd_att.GetGridControl().ColHidden(c_temp_wt)=0;
            grd_att.GetGridControl().ColHidden(c_temp_ot)=0;
            grd_att.GetGridControl().ColHidden(c_temp_nt)=0;
            grd_att.GetGridControl().ColHidden(c_temp_nt2)=0;
            grd_att.GetGridControl().ColHidden(c_temp_nt3)=0;
            grd_att.GetGridControl().ColHidden(c_temp_ht)=0;
            img_temp.status = "expand";
            img_temp.src = "../../../../system/images/close_popup.gif";
			img_temp.alt="Hide Column";
        }
        
    }
  
}
//-----------------------------------------------------------------------------------
function OnDelete()
{
    var ctrl=grd_att.GetGridControl();
    grd_att.DeleteRow();
    for(var i=1;i<=ctrl.SelectedRows;i++)
       grd_att.SetGridText(ctrl.SelectedRow(i-1),c_status,"1");
    
    
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
	dt_tmp=grd_att.GetGridData(event.row,event.col)//luu tru gia tri vua click
	ws=grd_att.GetGridData(event.row,c_ws)
	lstWS_temp.value=ws;
	idlbWS.text=lstWS_temp.GetText();
	
}
function On_check_next(n)
{
    var flag,temp, ctrl=grd_att.GetGridControl();
    flag=0;
    if(n==1)//date in 
    {
        if (ctrl.SelectedRows>1)
        {
            if(D_IN.GetData()=='T')
             {
                    for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
                        temp=grd_att.GetGridData(i,c_date_next);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_date_in,temp);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_n1,'-1');
                    }
              }
              else
              {
                    for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
                        temp=grd_att.GetGridData(i,c_date_now);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_date_in,temp);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_n1,'0');
                    }
              } 
        }  
        else
        {
                      alert((v_language =="ENG")?"Select more than 1 row please, 1 row, you can do in grid.":"Việc này chỉ cho phép khi bạn chọn nhiều hơn 1 dòng, 1 dòng thì chỉnh dưới lưới.")
                D_IN.value='F';

        }  
    }
    else if(n==2)
    {
        if (ctrl.SelectedRows>1)
        {
            if(D_OUT.GetData()=='T')
             {
                    for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
                        temp=grd_att.GetGridData(i,c_date_next);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_date_out,temp);
                        grd_att.SetGridText(ctrl.SelectedRow(i-1),c_n2,'-1');
                    }
              }
              else
              {
                    for(var i=1;i<=ctrl.SelectedRows;i++)
                    {
                            temp=grd_att.GetGridData(ctrl.SelectedRow(i-1),c_date_now);
                            grd_att.SetGridText(ctrl.SelectedRow(i-1),c_date_out,temp);
                            grd_att.SetGridText(ctrl.SelectedRow(i-1),c_n2,'0');
                    }
              } 
        } 
        else
        {
           alert((v_language =="ENG")?"Select more than 1 row please, 1 row, you can do in grid.":"Việc này chỉ cho phép khi bạn chọn nhiều hơn 1 dòng, 1 dòng thì chỉnh dưới lưới.")
                D_OUT.value='F';
        }     
    }    
}
//---------------------------------------------------------------------------
function Popup()
{
    var col=event.col;
    var flag=0;
    if((col== c_emp_id)||(col==c_fullname))
    {
        var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00701.aspx?emp_pk=" + grd_att.GetGridData(event.row, c_emp_pk) + "&dt1=" + grd_att.GetGridData(event.row, c_date_now)
        + "&dt2=" +grd_att.GetGridData(event.row,c_date_next)+ "&emp_id=" +grd_att.GetGridData(event.row,c_emp_id);
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:50;dialogHeight:20;dialogLeft:50;dialogTop:100;edge:sunken;scroll:yes;unadorned:yes;help:no');
        
    }
    else if(col==c_ws)
    {
        var fpath = System.RootURL + "/standard/forms/hr/ti/hrti00702.aspx?shift=" + grd_att.GetGridData(event.row, c_ws);
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:40;dialogHeight:15;dialogLeft:100;dialogTop:260;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(obj[0]!=grd_att.GetGridData(event.row,c_ws))
            {
                grd_att.SetGridText(event.row,col,obj[0]);
                grd_att.SetCellBgColor(event.row, c_ws,event.row, c_ws, 0x3366FF );
                grd_att.SetCellBold(event.row,c_ws,event.row,c_ws,true);
                lstWS_temp.value=obj[0];
	            idlbWS.text=lstWS_temp.GetText();
	            grd_att.SetGridText(event.row,c_status,"1");
	            
            }
        }
            //alert(obj[0]);
    }
    else if(col==c_abs_code)
    {
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00600.aspx?abs_code=" + grd_att.GetGridData(event.row, c_abs_code);
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:25;dialogLeft:200;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(obj[0]!=grd_att.GetGridData(event.row,c_abs_code))
            {
                grd_att.SetGridText(event.row,col,obj[0]);
                grd_att.SetCellBgColor(event.row, c_abs_code,event.row, c_abs_code, 0x3366FF );
                grd_att.SetCellBold(event.row,c_abs_code,event.row,c_abs_code,true);
                if (grd_att.GetGridData(event.row,c_status)!="1" )
	                grd_att.SetGridText(event.row,c_status,"2");
            }
        }
           
    }
    if((grd_att.GetGridData(event.row,c_status)=="1" || grd_att.GetGridData(event.row,c_status)=="2") && (grd_att.GetGridData(event.row,c_close)=="M"||grd_att.GetGridData(event.row,c_close)=="Y") )
	  {alert((v_language =="ENG")?"You can't modify and save this record because salary period was closed!":"Bạn không thể điều chỉnh và lưu thông tin của dòng dữ liệu này vì tháng lương đã đóng! ") ;
	      grd_att.SetGridText(event.row,c_status,"");
	      return;
	  }

}
//---------------------------------------------------------------------------
function get_random(num)
{
    var ranNum= Math.floor(Math.random()*num);//tra ra so nguyen
    return ranNum;
}
//---------------------------------------------------------------
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
			if(confirm((v_language =="ENG")?"Set to all blank records (not include holiday)?":"Điền vào tất cả những dòng còn trống (không kể ngày nghỉ)?"))
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
								if (grd_att.GetGridData(i,c_in_time)=="")
								{
									var day_type;
									day_type=grd_att.GetGridData(i,c_hol_type); //day type
									if(day_type==0)
									{
									   grd_att.SetGridText(i,c_in_time,result);
									   grd_att.SetGridText(i,c_wt,"");
									   grd_att.SetGridText(i,c_status,"1");
									}   
								}
							}
							if (idLstInOut.value=="2") //out
							{
								
								if (grd_att.GetGridData(i,c_out_time)=="")
								{
									var day_type;
									day_type=grd_att.GetGridData(i,c_hol_type); //day type
									if(day_type==0)
									{
									   grd_att.SetGridText(i,c_out_time,result);
									   grd_att.SetGridText(i,c_wt,"");
									   grd_att.SetGridText(i,c_status,"1");
									}   
									
								}
							}
						}							
						else if (idLstInOut.value=="3")
						  {      
								grd_att.SetGridText(i,c_wt,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						  }	    
						else if (idLstInOut.value=="4")
						{
								grd_att.SetGridText(i,c_ot,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						}		
						else if (idLstInOut.value=="5")
						{
								grd_att.SetGridText(i,c_nt,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						}
						else if (idLstInOut.value=="7") //NT2
						{
								grd_att.SetGridText(i,c_nt2,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						}		
						else if (idLstInOut.value=="8") //NT3
						{
								grd_att.SetGridText(i,c_nt3,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						}		
						else if (idLstInOut.value=="6")//HT 
						{
								grd_att.SetGridText(i,c_ht,Trim(idHH.text));
								grd_att.SetGridText(i,c_status,"1");
						}		
						else
						{
							alert((v_language =="ENG")?"Incorrect type of time.(HH:00->24),(mm1,mm2: 00->60), pld try again":"Kiểu giờ bạn nhập không đúng, hãy nhập lại?")
							return;
						}
					}
				}
			}
		else
		{			
			for(i=0;i<gCtrl.SelectedRows;i++)
			{
				var tmp=gCtrl.SelectedRow(i);	
				
				if((Number(mm1)>=0)&&(Number(mm1)<60)&&(Number(mm2)>=0)&&(Number(mm2)<60)&&(Number(hh)>=0)&&(Number(hh)<=23)&&(Number(mm1)<Number(mm2))
					&&(mm1.length==2)&&(mm2.length==2)&&(hh.length==2))
				{
					mm_tmp=Number(mm2)-Number(mm1)
					ran_var=get_random(mm_tmp)+Number(mm1)
					if(Number(ran_var)<10)
						ran_var="0"+ran_var
					result=hh+":"+ran_var
					
					if (idLstInOut.value=="1")
					{
						grd_att.SetGridText(tmp,c_in_time,result);
						grd_att.SetGridText(tmp, c_wt, "");
						grd_att.SetGridText(tmp,c_status,"1");
					}	
					if (idLstInOut.value=="2")
					{
						grd_att.SetGridText(tmp,c_out_time,result);
						grd_att.SetGridText(tmp, c_wt, "");
						grd_att.SetGridText(tmp,c_status,"1");
					}	
					
				}
				else if (idLstInOut.value=="3")
				{
					grd_att.SetGridText(tmp,c_wt,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}	
				else if (idLstInOut.value=="4")
				{
					grd_att.SetGridText(tmp,c_ot,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}	
				else if (idLstInOut.value=="5")
				{
					grd_att.SetGridText(tmp,c_nt,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}
				else if (idLstInOut.value=="7")
				{
					grd_att.SetGridText(tmp,c_nt2,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}	
				else if (idLstInOut.value=="8")
				{
					grd_att.SetGridText(tmp,c_nt3,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}	
				else if (idLstInOut.value=="6")
				{
					grd_att.SetGridText(tmp,c_ht,Trim(idHH.text));
					grd_att.SetGridText(tmp,c_status,"1");
				}	
				else
				{
					alert((v_language =="ENG")?"Incorrect type of time.(HH:00->24),(mm1,mm2: 00->60), pld try again":"Kiểu giờ bạn nhập không đúng, hãy nhập lại?");
					return;
				}
				
			}
		}
	}
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
						grd_att.SetGridText(i,c_in_time,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "2": //out
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_out_time,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "3": //wt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_wt,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "4": //ot
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_ot,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "5": //nt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_nt,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "7": //nt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_nt2,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "8": //nt
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_nt3,"")
						grd_att.SetGridText(i,c_status,"1");
					}	
				break;
				case "6": //ht
					for(i=1;i<ctrl.rows;i++)
					{
						grd_att.SetGridText(i,c_ht,"")
						grd_att.SetGridText(i,c_status,"1");
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
					grd_att.SetGridText(tmp,c_in_time,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "2":
					grd_att.SetGridText(tmp,c_out_time,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "3":
					grd_att.SetGridText(tmp,c_wt,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "4":
					grd_att.SetGridText(tmp,c_ot,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "5":
					grd_att.SetGridText(tmp,c_nt,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "7":
					grd_att.SetGridText(tmp,c_nt2,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "8":
					grd_att.SetGridText(tmp,c_nt3,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
				case "6":
					grd_att.SetGridText(tmp,c_ht,"")
					grd_att.SetGridText(tmp,c_status,"1");
				break;
			}
		}
	}
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
   
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();                  
}
function onChange_org()
{

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
<gw:data id="datWorkShift_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WS_ROLE"  > 
                <input>
                    <input bind="lstOrg" />
                </input> 
                <output>
                    <output bind="txt_WS_temp" />
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
<gw:data id="datAttendence_absence" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,5,6,8,9,11,12,13,14,15,16,17,18,19,21,22,23,26,27,28,30,32,33,34,35,36,38,39,40,41,42,43,44,45,46,47,48,49" function="ST_HR_SEL_HRTI00700_0" procedure="ST_HR_UPD_HRTI00700_0"> 
                <input bind="grd_att" >
                    <input bind="lstOrg" />
                    <input bind="lstWG" />
                    <input bind="lstWS" />
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="idtxtTmp" />
                    <input bind="lstNation" />
                    <input bind="lstReg" />
                    <input bind="idPrint_type" />
                    <input bind="idConfirm" />
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

<!------------------------------------------>
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
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" class="eco_line">
    <tr style="height:4%" class="eco_bg">
        <td colspan="2">
            <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                <tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"   >
					</td>
					<td colspan=12 width="12%" style="border:0" align="left" >Employee</td>
					<td colspan=20 width="20%" style="border:0"> 
						<gw:textbox id="idtxtTmp" maxlen = "20" styles="width:100%" onenterkey="OnSearch()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button id="ibtnSearch" img="search" text="Search" onclick="OnSearch()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button id="ibtnSave" img="save" text="Save" onclick="OnUpdate()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button id="ibtnDelete" img="delete" text="Delete" onclick="OnDelete()" />
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnReport()" />
					</td>
					
					<td colspan=15 width="15%" style="border:0" align="left" >
						<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
					</td>
					<td colspan=10 width="10%" style="border:0" align="center" >
						Rows: 
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:label id="idRecord" text="" styles="color:red;width:100%;font-weight: bold;font-size:12" ></gw:label>
					</td>
					
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:2%">
        <td colspan="2" class="eco_line_t">
            <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                <tr style="border:0.5;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0" align="right"  >
						<input type="radio" name="option_P" value="1" checked onclick="onClickOption(1)" >
					</td>
					<td colspan=12 width="12%" style="border:0"  align="left" >
						Daily
					</td>
					<td colspan=20 width="20%" style="border:0"  align="left" >
						<gw:datebox id="DailyDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
					</td>
					<td colspan=2 width="2%" style="border:0" align="right"  >
						<input type="radio" name="option_P" value="2" onclick="onClickOption(2)" >
					</td>
					<td colspan=12 style="border:0" width="12%" align="left" >
						Period
					</td>
					<td colspan=10 width="10%" style="border:0"  align="left" >
						<gw:datebox id="FromDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
					</td>
					<td colspan=10 width="10%" style="border:0"  align="left" >
						<gw:datebox id="ToDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
					</td>
					<td colspan=2 width="2%" style="border:0"  align="right" >
						<input type="radio" name="option_P" value="3" onclick="onClickOption(3)" >
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						Month
					</td>
					<td colspan=20 width="20%" style="border:0"> 
						<gw:datebox id="Month"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" type=month />
					</td>
				</tr>
				<tr style="border:0.5;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0" align="left"   >
						
					</td>
					<td colspan=12 width="12%" style="border:0"  align="left" >
						<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none" class="eco_link">Organization</a>
					</td>
					<td colspan=20 width="20%" style="border:0"  align="left" >
						<gw:list  id="lstOrg"  maxlen = "100" styles='width:100%'  />
					</td>
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=12 style="border:0" width="12%" align="left" >
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
				<tr style="border:0.5;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0" align="left"   >
						
					</td>
					<td colspan=12 width="12%" style="border:0"  align="left" >
						Work Shift
					</td>
					<td colspan=20 width="20%" style="border:0"  align="left" >
						<gw:list  id="lstWS" value="ALL"  maxlen = "100" styles='width:100%' onchange="OnChangeShift()">
                            <data><%=CtlLib.SetListDataSQL("SELECT pk,shift||'-'||remark FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%>|ALL|Tất cả</data>
						</gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=12 style="border:0" width="12%" align="left" >
						Maternity
					</td>
					<td colspan=20 width="20%" style="border:0" align="left">
						<gw:list  id="lstReg" value="ALL" maxlen = "100" styles='width:100%' >
                            <data>|ALL|Tất cả|1|Chế độ</data>
						</gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						Data Type
					</td>
					<td colspan=20 width="20%" style="border:0"> 
						<gw:list  id="idPrint_type" value="5" styles='width:100%' onChange="">
							<data>|1|Vắng mặt|2|Giờ làm|3|Đúng giờ|4|Giờ trống|5|Tất cả</data>
						</gw:list>
					</td>
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:2%" class="eco_bg">
        <td colspan="2" class="eco_line_t">
            <table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
                <tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0" align="left"  >
						<gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll(chkSelectAll,grd_att)" ></gw:checkbox >
					</td>
					<td colspan=12 width="12%" style="border:0" align="left" ><font color="FF3399">Set Time</font></td>
					<td colspan=10 width="10%" style="border:0" align="left"> 
						<gw:list id="idLstInOut"  styles="width:100%" value="0" onchange="change_list()" />
					</td>
					<td colspan=2 width="4%" style="border:0" align="right"> 
						<gw:label id="idlbHH" styles="width:100%">HH</gw:label>
					</td>
					<td colspan=5 width="5%" style="border:0"> 
						<gw:textbox id="idHH" maxlen = "5" styles="width:100%" onkeypress="" />
					</td>
					<td colspan=2 width="4%" style="border:0" align="right" >
						<gw:label id="idlbMM1" styles="width:100%">MM1</gw:label>
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:textbox id="idMM1" maxlen = "2" styles="width:100%"  onkeypress="return Numbers(event)"/>
					</td>
					<td colspan=2 width="4%" style="border:0" align="right" >
						<gw:label id="idlbMM2" styles="width:100%">MM2</gw:label>
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:textbox id="idMM2"	maxlen = "2" styles="width:100%" onkeypress="return Numbers(event)" />
					</td>
					
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="idBtnSet"  styles='width:100%' img="set"  text="Set"  onclick="OnSetToGrid()"/>
					</td>
					<td colspan=5 width="5%" style="border:0" align="center" >
						<gw:button id="idBtnClear"  styles='width:100%' img="clear"  text="Clear"  onclick="onClearGrid()"/>
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						<gw:label id="idlbN1" styles="width:100%">N</gw:label>
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						<gw:checkbox id="D_IN" value="F" onclick="On_check_next(1)" ></gw:checkbox >
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						<img status="collapse" id="imgMaster" alt="Show Column" src="../../../../system/images/iconmaximize.gif" style="cursor:hand;position:absolute;" onclick="OnToggle(1)"  />
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						<gw:label id="idlbN2" styles="width:100%">N</gw:label>
					</td>
					<td colspan=2 width="2%" style="border:0" align="left" >
						<gw:checkbox id="D_OUT" value="F" onclick="On_check_next(2)" ></gw:checkbox >
					</td>
					<td colspan=20 width="20%" style="border:0" align="left" >
						
					</td>
					<td colspan=2 width="2%" style="border:0" align="center" >
						<img status="collapse" id="img_temp" alt="Show Column" src="../../../../system/images/iconmaximize.gif" style="cursor:hand;position:absolute;" onclick="OnToggle(2)"  />
					</td>
				</tr>
            </table>
        </td>
    </tr>
    <tr style="height:94%">
        <td colspan="2" class="eco_line_t">
            <gw:grid
			    id="grd_att"
			    header="_EMP_PK|ORGANIZATION|GROUP|EMP_ID|FULL_NM|W_S|DATE_IN|N|IN TIME|DATE_OUT|N|OUT TIME|WT|OT|NT|NT2|NT3|HT|ABSENCE CODE|H|ALE|_WKD_PK|_OT_PK|_ABS_PK|WorkDT|_WGROUP|_NT_PK|_HT_PK|_Date_Now|_date_next|_Hol_type|Mod Case|_No Scan|_S|_NT2_PK|_NT3_PK|_OT Plus|_close|Note|Temp Out|Temp In|Temp Out2|Temp In2|WT|OT|NT|NT2|NT3|HT|Confirm"
			    format="0|0|0|0|0|2|4|3|0|4|3|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
			    aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
			    defaults="||||||||||||||||||||||||||||||||||||||||||||||||||"
			    editcol="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|1|0|1|1|1|1|1|1|1|1|1|1|1|0"
			    widths="0|1500|1500|1000|2500|500|1200|300|1000|1200|300|1000|500|500|500|500|500|500|1500|300|600|0|0|0|1500|1500|0|0|0|0|0|1500|500|0|0|500|0|0|1000|1000|1000|1000|1000|500|500|500|500|500|500|500"
			    styles="width:100%;height:100%"
			    sorting="T"
			    onafteredit="On_AfterEdit()"
			    acceptNullDate="T"
			    oncelldblclick = "Popup()"
			    onentercell = "On_click()"/>
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
<gw:list  id="lstWS_temp" value="ALL"  maxlen = "100" styles='display:none' >
                        <data><%=CtlLib.SetListDataSQL("SELECT PK,shift||'-'||remark FROM thr_work_shift WHERE DEL_IF = 0 and use_yn='Y'  order by shift")%>|ALL|WS-Select All</data></gw:list>
<gw:textbox id="txtReport_tmp" styles="display:none"/>             
<gw:textbox id="txt_WS_temp" styles="display:none"/>             
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />               
<gw:list  id="idConfirm" value="ALL" styles="width:100%;display:none" >
                <data>|Y|Confirm-Y|N|Confirm-N|ALL|Confirm-All</data></gw:list>
<gw:label id="idInterval" text="" styles="width:100%;display:none" ></gw:label>
<gw:label id="idlbWS" styles="width:100%;display:none;color:red"></gw:label>
<gw:label id="idlbWtOtNtHt" styles="width:100%;display:none"></gw:label>
</body>
</html>

