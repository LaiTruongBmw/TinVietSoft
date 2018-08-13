<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var user;
var value_before=0;
var _days=0;
var tmp1,tmp2;
var flag_open=0;
var col_f=7;//col ngay dau tien
var col_e=37; //col ngay cuoi cung
var tab_no=0;
var check_init = 0;
var rpt_no = 0;
//"WGroup|_Old WGroup|Emp ID|Full Name|Join Date|Work Date|Holiday Type|Work Shift|_Emp_PK|_WS_Detail_PK|_Approve Y/N|Salary Type"   
var G_WGROUP = 0,
	G_OLD_WGROUP = 1,
	G_EMP_ID 	 = 2,
	G_FULL_NAME  = 3,
	G_JOIN_DATE  = 4,
	G_WORK_DATE  = 5,
	G_HOLIDAY_TYPE = 6,
	G_WORK_SHIFT = 7,
	G_EMP_PK = 8,
	G_WS_DETAIL_PK = 9
	G_APPROVE_YN = 10,
	G_SALARY_TYPE = 11;
//	_emp_pk|EMP ID|Full Name|Organization|WGroup|Join date|Left date|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_w_mon|_from|_to
//											   |_DT1|_DT2|_DT3|_DT4|_DT5|_DT6|_DT7|_DT8|_DT9|_DT10|_DT11|_DT12|_DT13|_DT14|_DT15|_DT16|_DT17|_DT18|_DT19|_DT20|_DT21|_DT22|_DT23|_DT24|_DT25|_DT26|_DT27|_DT28|_DT29|_DT30|_DT31"
var G2_EMP_PK =0,
	G2_EMP_ID =1,
	G2_EMP_NAME = 2,
	G2_ORG = 3,
	G2_WGROUP = 4,
	GR_JOIN_DT = 5,
	G2_LEFT_DT = 6,
	G2_D1 = 7,
	G2_D2 = 8,
	G2_D3 = 9,
	G2_D4 = 10,
	G2_D5 = 11,
	G2_D6 = 12,
	G2_D7 = 13,
	G2_D8 = 14,
	G2_D9 = 15,
	G2_D10 = 16,
	G2_D11 = 17,
	G2_D12 = 18,
	G2_D13 = 19,
	G2_D14 = 20,
	G2_D15 = 21,
	G2_D16 = 22,
	G2_D17 = 23,
	G2_D18 = 24,
	G2_D19 = 25,
	G2_D20 = 26,
	G2_D21 = 27,
	G2_D22 = 28,
	G2_D23 = 29,
	G2_D24 = 30,
	G2_D25 = 31,
	G2_D26 = 32,
	G2_D27 = 33,
	G2_D28 = 34,
	G2_D29 = 35,
	G2_D30 = 36,
	G2_D31 = 37,
	G2_W_MONTH = 38,
	G2_FROM = 39,
	G2_TO = 40,
	G2_DT1 = 41,
	G2_DT2 = 42,
	G2_DT3 = 43,
	G2_DT4 = 44,
	G2_DT5 = 45,
	G2_DT6 = 46,
	G2_DT7 = 47,
	G2_DT8 = 48,
	G2_DT9 = 49,
	G2_DT10 = 50,
	G2_DT11 = 51,
	G2_DT12 = 52,
	G2_DT13 = 53,
	G2_DT14 = 54,
	G2_DT15 = 55,
	G2_DT16 = 56,
	G2_DT17 = 57,
	G2_DT18 = 58, 
	G2_DT19 = 59,
	G2_DT20 = 60,
	G2_DT21 = 61,
	G2_DT22 = 62,
	G2_DT23 = 63,
	G2_DT24 = 64,
	G2_DT25 = 65,
	G2_DT26 = 66,
	G2_DT27 = 67,
	G2_DT28 = 68,
	G2_DT29 = 69,
	G2_DT30 = 70,
	G2_DT31 = 71;
function BodyInit()
{   
    //if (v_language!="ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	user= "<%=session("USER_ID")%>";
	idDBUSR.text= "<%=session("APP_DBUSER")%>";
	
    SelectOption(1);    
    <%=CtlLib.SetGridColumnComboFormat( "grdEmpShift" , 7 , "select pk, description from thr_work_shift a where a.del_if=0 and a.use_yn='Y' order by a.shift") %>;        
    <%=CtlLib.SetGridColumnComboFormat( "grdEmpShift" , 6 , "SELECT A.CODE, A.CODE_NM   FROM TCO_ABCODE A,TCO_ABCODEGRP B WHERE B.ID = 'COAB0140'   AND A.TCO_ABCODEGRP_PK = B.PK AND A.DEL_IF = 0 AND B.DEL_IF = 0 union all select '','' from dual") %>;        
    <%=CtlLib.SetGridColumnComboFormat( "grdEmpShift" , 0 , "select pk, workgroup_nm from thr_work_group where del_if=0 order by nvl(seq,9999)") %>;        
    <%=CtlLib.SetGridColumnComboFormat( "grdEmpShift" , 1 , "select pk, workgroup_nm from thr_work_group where del_if=0 order by nvl(seq,9999)") %>;        
     txt_WG_temp1.text="<%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0 order by nvl(seq,9999)")%>";
     txt_WS_temp.text="<%=CtlLib.SetListDataSQL("select pk, description from thr_work_shift a where a.del_if=0 and a.use_yn='Y'") %>";
    grdEmpShift.GetGridControl().FrozenCols =3;
    grdWork2.GetGridControl().FrozenCols =3;
    
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00400', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstReport.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00400', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
    lstReport2.SetDataText(data);
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select v.code, decode('" + Session("SESSION_LANG").ToString() + "','ENG',v.code_nm, v.code_fnm) from vhr_hr_code v where v.id='HR0056' order by v.code")%>";
    grdEmpShift.SetComboFormat(G_SALARY_TYPE,t1);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg2.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	lstWG2.SetDataText(data);
	lstWG2.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL ")%>";
	lstNation.SetDataText(data);
	lstNation.value = "01";
	
/*	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL ")%>";
	lstStatus.SetDataText(data);
	lstStatus.value = "A";*/
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	
	ChangeColorItem(lstOrg.GetControl());
    ChangeColorItem(lstOrg2.GetControl());
	
	var now = new Date(); 
	var ldate;
	ldate=dtFromDate.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	dtFromDate.value=ldate ;

    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
          {
            datUser_info.Call(); 
          }
     else
     {      
			txtOrgPK.text=lstOrg.value;
            datWorkGroup_info.Call();   
    }   
}

//-----------------------------------------------
function XuLyReport(obj,param)      //truyen vao param = "text" hoac "value"
{
    var lst_data = obj.split("|");
    var lst_ret;

    for (var i = 0; i < lst_data.Length; i++) {
        if (param == "value") {
            if (i % 2 == 0)
                lst_ret = lst_data[i];
        }
        else {
            if (i % 2 != 0)
                lst_ret = lst_data[i];
        }
    }
    return lst_ret;
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
//-----------------------------------------------
function OnShowPopup(n)
{
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
         if (obj!=null)
        {       if(n==1)
             lstOrg.value=obj;
             else
             lstOrg2.value=obj;
             
             ChangeOrganization(n)
        }
}

//-----------------------------------------------
function OnDataReceive(obj)
{   
     if (obj.id=="datUser_info")
        {
            
            lstOrg.SetDataText(txt_temp.text);
            lstOrg2.SetDataText(txt_temp.text);
            txtOrgPK.text=lstOrg.value;

            ChangeColorItem(lstOrg.GetControl());
            ChangeColorItem(lstOrg2.GetControl());

            datWorkGroup_info.Call();
        }
       if (obj.id=="datWorkGroup_info")
        {
            if(tab_no==0)
            {   txt_WG_temp1.text=txt_WG_temp.text;
                lstWG.SetDataText(txt_WG_temp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG2.SetDataText(txt_WG_temp.text+ "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG.value='ALL';
                lstWG2.value='ALL';
                datWorkShift_info.Call();
            }
            if(tab_no==1)
            {   lstWG.SetDataText(txt_WG_temp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG.value='ALL';
                txt_WG_temp1.text=txt_WG_temp.text;
                datWorkShift_info.Call();
            }
            if(tab_no==2)
             {
                lstWG2.SetDataText(txt_WG_temp.text+ "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG2.value='ALL';
                datGet_period_kind.Call();
             }
            
        
        }  
        if (obj.id=="datGet_period_kind")
         {
         idLst_period2.SetDataText(txt_Sal_kind.text+"|M|"+(v_language =="ENG")?"Month":"Tháng");
            datGet_Period.Call();
         }
        if (obj.id=="datWorkShift_info")
        {
            if(tab_no==0||tab_no==1)
            {
               
                tab_no=1;
            }
            check_init=1;
            
        
        }
    if (obj.id=="datEmpShift")
    {
        lblRecord.text=grdEmpShift.rows-1 ;
        auto_resize_column(grdEmpShift,0,grdEmpShift.cols-1,0);
    }
    if (obj.id=="datImpExcel")
    {
        lblRecord.text=grdEmpShift.rows-1 ;
        auto_resize_column(grdEmpShift,0,grdEmpShift.cols-1,0);
    }
    else if (obj.id=="datSunday")
     {
          fill_sunday();
          check_init=1;
     }
    if (obj.id=="datSch_mon_detail")
    {
        lblRecord2.text=grdWork2.rows-1 ;
        auto_resize_column(grdWork2,0,grdWork2.cols-1,0);
		for (var i = 1; i < grdWork2.rows; i++) 
			{	
				for(var k = 0; k < 32; k++ )
				{
					if (Trim(grdWork2.GetGridData(i, G2_DT1 + k)) == "SUN") 
					{
						grdWork2.SetCellBgColor(i, G2_D1 + k , i, G2_D1 + k, 0x99FFCC);
					}
					if (Trim(grdWork2.GetGridData(i, G2_DT1 + k)) == "HOL") 
					{
						grdWork2.SetCellBgColor(i, G2_D1 + k, i, G2_D1 + k, 0xc0cbff);
					}
				}
			}
    }
    if(obj.id=="datGet_Period")
	{
	    
	    var n;
	    _days=daysInMonth(idMon_fr2.value.substring(4,6),idMon_fr2.value.substring(0,4));	
		tmp1=Number(idMon_fr2.value.substring(6,8));
		tmp2=Number(idMon_to2.value.substring(6,8));
		//alert(idMon_fr2.value);
        //alert(idMon_to2.value);
        //alert(_days);
		if(tmp2<_days)//chu ky giua thang
		{
		    for(var i=tmp1;i<=31+tmp2;i++)
		    {
		        if(i>31)
		            n=i-31
		         else
		            n=i   
		        grdWork2.SetGridText(0,i-tmp1+col_f,n);
		    }    
		    for(var i=1;i<=31-_days;i++)		     
             grdWork2.GetGridControl().ColHidden(col_f+_days-tmp1+i)=true;                          
		}
		else
		{
		    for(var i=1;i<=31;i++)
		        grdWork2.SetGridText(0,i+col_f-1,i);
		        
		    for(var i=1;i<=31-_days;i++)
		     grdWork2.GetGridControl().ColHidden(i+_days+col_f-1)=true;    
		} 
		
		if(idClose_flag2.text=="Y")
		{
		     idRecord.text="This month is close";
		     ibtnSave2.SetEnable(0);
		}     
		else
		{
		    idRecord.text="";     
		    ibtnSave2.SetEnable(1);
		   // inputfile..SetEnable(1);
		} 
		datSunday.Call("SELECT");   
	}
	else if(obj.id == "datFind_Report")
   {	
		var url = System.RootURL;
		switch(txtReport_Code.text){
			case "106":
			{ 
				var url =url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG.value +  '&p_emp_search=' + txtTemp.text 
					+ '&p_tco_org_pk=' + lstOrg.value + '&p_from_dt=' + dtFromDate.value + '&p_to_dt=' + dtToDate.value + '&p_nation=' + lstNation.value
					+ '&p_lang='+ v_language;
					break;
			}
			case "107":
			{	
				var url =url + txtReport_tmp.text + '?p_user=' + user + '&p_wg=' + lstWG2.value +  '&p_emp_search=' + txtTemp2.text 
					+ '&p_tco_org_pk=' + lstOrg2.value + '&p_from_dt=' + idMon_fr2.value + '&p_to_dt=' + idMon_to2.value
					+'&p_month='+ idWorkMon2.value + '&p_lang='+ v_language;
					break;
			}
			
		}
		window.open(url);
	}
	
   
}    

//-----------------------------------------------
function SelectOption(obj)
{   
    switch (obj)
    {
        case 1:
            txtOption.text=1;
            break;
        case 2: 
            txtOption.text=2;
            break;
    }    
} 
//---------------------------------
function OnSearch(n)
{
    if(check_init==1)
    {
        if(n==1)
            {
          
          //add wshift to grid
           tab_no=1;
           var arr = txt_WS_temp.text.replace("DATA|",'').split("|");
           var s="";
           //alert(arr);
           var t=0;
	           for(var i=0;i< (arr.length+1)/2-1;i++)
	            {
		            s = s +"#" + arr[t] + ";" + arr[t+1]+"|";
		            t=t+2;
		            //alert(s);
	            }
	           // alert(s);
                grdEmpShift.SetComboFormat(7,s  );
                
            //add wgroup to grid    
            arr = txt_WG_temp1.text.replace("DATA|",'').split("|");
           s="";
            t=0;
	           for(var i=0;i< (arr.length+1)/2-1;i++)
	            {
		            s = s +"#" + arr[t] + ";" + arr[t+1]+"|";
		            t=t+2;
		        }
	           grdEmpShift.SetComboFormat(0,s  );
           
            datEmpShift.Call("SELECT");
            }
        else
            {tab_no=2;
            datSch_mon_detail.Call("SELECT");    
            }
    }            
        
}

//--------------------------------------
function OnSave(n)
{
    if(check_init==1)
    {
        if(n==1)
        {
            if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?") && CheckSave())
                datEmpShift.Call();   
        }
        else   
            if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?"))     
                datSch_mon_detail.Call();
    }            
}
//------------------------------------------
function CheckSave()
{
    if (txtOption.text==2)
    {
        for (var i=1;i<=grdEmpShift.rows-1;i++)
        {
            if (grdEmpShift.GetGridData(i,7)=="" && grdEmpShift.GetRowStatus(i)==16)
            {
                alert((v_language =="ENG")?"You have to input shift at row ":"Bạn phải nhập ca tại dòng " + i);
                return false;
            }
        }
    }
    return true;
}
//----------------------------------------------

function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			tdDetail.style.display="none";
            tdDetail.style.width="0%";
            tdMaster.style.height="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show changed group";
			
        }
        else
        {
            imgMaster.status = "expand";
            tdDetail.style.display="";
            tdDetail.style.width="18%";
            tdMaster.style.height="82%";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Close changed group";
			
			if (grdEmpShift.row>1)
            {
                
                txtEmp_PK.text=grdEmpShift.GetGridData(grdEmpShift.row,8);
                datChangedWGroup.Call("SELECT");
            }
        }
  
}

function OnReport(obj)
{
	

	rpt_no = obj;
	if (check_init == 1) 
	{
	    switch (obj) 
		{
	        case 1:
	            {
	                if (lstReport.value == "1") {
	                    txtReport_Code.text = lstReport.value;
	                    rpt_no = 1;
	                }
	                else {
	                    txtReport_Code.text = lstReport.value;
	                    rpt_no = 2;
	                }
					txtOrg_tmp_pk.text = lstOrg.value;
	               
	                break;
	            }
	        case 2:
	            {
	                txtReport_Code.text = lstReport2.value;
					txtOrg_tmp_pk.text = lstOrg2.value;
	                rpt_no = 3;

	                break;
	            }

	    }

	    
	    datFind_Report.Call();
	}
}
//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
function onPageActive()
{
    if(tabMain.GetCurrentPageNo()==1)
    {
        //onHide_column();
        if(flag_open==0)
        {
            flag_open=1;
            idMon_fr2.SetEnable(0);
            idMon_to2.SetEnable(0);
            OnChangeMon2();
         }   
        
    }
}
function onHide_column()
{
    //xac dinh thang co bao nhieu ngay 
     grdWork2.ClearData();   
        for(var i=7;i<=37;i++)
            grdWork2.GetGridControl().ColHidden(i)=0
            
        var n=getDaysInMonth(idWorkMon2.value);
        for(var i=n+7;i<=37;i++)
            grdWork2.GetGridControl().ColHidden(i)=1
     datSunday.Call("SELECT");       
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
function OnShowWorkShift()
{
    
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00200.aspx?shift=" + 0;
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:40;dialogHeight:20;dialogLeft:200;dialogTop:260;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
}
function on_check()
{
    var r=event.row;
    var c=event.col;
    if(isNaN(grdWork2.GetGridData(event.row,event.col)))
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
//-------------------tab 2---------------------------------------------------
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
    {txtOrgPK.text=lstOrg.value;
    tab_no=1;
    }
    if(n==2)
    {
    txtOrgPK.text=lstOrg2.value;
    tab_no=2;
    }
    datWorkGroup_info.Call();
}

function OnImportNew()
{
	var currentTime = new Date();		
	txtSequence.text = currentTime.getTime();
	
	// argument fixed table_name, procedure, procedure_file
	var url = System.RootURL + '/system/binary/ReadExcel.aspx?import_seq=' + txtSequence.text + '&p_err_cont=Y' + '&table_name=TES_FILEOBJECT' + '&procedure=ctl.SP_INSERT_IMAGE' + '&procedure_file=' + idDBUSR.text + '.ST_HR_UPD_HRTI00400_4' + '&p_type=1' + '&p_1=' + '&p_2=' + '&p_3=' + '&p_4=' + '&p_5=';
	txtRecord.text = System.OpenModal(  url , 415, 100 , "unadorned:on ; center:yes; edge:sunken ; resizable:yes;status:yes;" );
	
	if (txtRecord.text != 'undefined')
		alert("Imported : " + txtRecord.text + " record(s)");
		
    datImpExcel.Call("SELECT");
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
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
<!-------------------------------------------------------->
<gw:data id="datGet_period_kind" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_PERIOD_BY_ORG"  > 
                <input>
                    <input bind="lstOrg2" />
                </input> 
                <output>
                    <output bind="txt_Sal_kind" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datWorkShift_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WS_ROLE"  > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txt_WS_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datEmpShift" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" function="ST_HR_SEL_HRTI00400_0" parameter="0,1,5,6,7,8,9" procedure="ST_HR_UPD_HRTI00400_0"> 
                <input bind="grdEmpShift">
                    <input bind="lstOrg" /> 
                    <input bind="lstWG" />
                    <input bind="dtFromDate" />
                    <input bind="dtToDate" />
                    <input bind="txtTemp" />
                    <input bind="txtOption" />
					<input bind="lstNation"/>
                </input> 
                <output bind="grdEmpShift" />
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datImpExcel" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="grid" function="ST_HR_SEL_HRTI00400_1" > 
                <input bind="grdEmpShift">
                    <input bind="txtSequence" /> 
                </input> 
                <output bind="grdEmpShift" />
            </dso> 
        </xml> 
</gw:data>


<!---------------------tab 2 ----------------------------------->
<gw:data id="datSunday" onreceive="OnDataReceive(this)" > 
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
<gw:data id="datSch_mon_detail" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40" function="ST_HR_SEL_HRTI00400_3" procedure="ST_HR_UPD_HRTI00400_3"> 
                <input bind="grdWork2" >
                    <input bind="lstOrg2" />
                    <input bind="lstWG2" />
                    <input bind="idWorkMon2" />
                    <input bind="idMon_fr2" />
                    <input bind="idMon_to2" />
                    <input bind="txtTemp2" />
                </input>
                <output  bind="grdWork2" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_Period" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_hr_CO_sal_period_by_org" > 
                <input >
                    <input bind="lstOrg2" />
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

    <!------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_FIND_REPORT_2" > 
                <input>
                    <input bind="txtReport_Code" />
                    <input bind="txtOrg_tmp_pk" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<gw:tab id="tabMain"  border="0" style="width:100%;height:100%;" onpageactivate="onPageActive()"  > 
<table name="Detail" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">					
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:textbox text="" id="txtTemp" styles='width:100%' onenterkey="OnSearch(1)" />
							</td>
							
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=10 width="10%" style="border:0" width="12%" align="left" >
								Group
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstWG"  maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=10 width="10%" style="border:0" width="12%" align="left" >
								Nation
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstNation"  maxlen = "100" styles='width:100%' />
							</td>
							<td colspan=4 width="4%"></td> 
						</tr>
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstOrg"  maxlen = "100" styles='width:100%' onchange="ChangeOrganization(1)" />
							</td>						
							<td colspan=2 width="2%" style="border:0" align="left">								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								 <gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" /> 							
								~							
								 <gw:datebox id="dtToDate"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=10 width="10%" style="border:0" width="12%" align="left" >
								
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								
							</td>
							<td colspan=4 width="4%"></td>
						</tr>			
					</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left">								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord"  text="" maxlen = "100"  />
							</td>
							<td colspan=70 width="70%"></td>
							<td colspan=5 width="5%" style="border:0" >
								<gw:button id="ibtnSearch" text="Search" img="search" text="Search" onclick="OnSearch(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" >
								<gw:button id="ibtnSave" text="Save" img="save" text="Save" onclick="OnSave(1)" />
							</td>
							<td colspan=5 width="5%" style="border:0" >
								<gw:button id="ibtnRpt" text="Report" img="excel" text="Report" onclick="OnReport(1)" />
							</td>							
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table width="100%" style="height:99%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%"> 
                             <gw:grid   
								id="grdEmpShift"  
								header="WGroup|_Old WGroup|Emp ID|Full Name|Join Date|Work Date|Holiday Type|Work Shift|_Emp_PK|_WS_Detail_PK|_Approve Y/N|Salary Type"   
								format="2|2|0|0|4|4|2|0|0|0|3|2"  
								aligns="2|0|1|0|1|1|1|0|0|0|0|0"  
								defaults="|||||||||||"  
								editcol="1|0|0|0|0|0|1|1|0|0|0|1"  
								widths="2200|0|1200|2500|1200|1200|1200|4500|1000|0|0|1500"
								autosize = true
								styles="width:100%; height:100% "   
								sorting="T" /> 
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>
<table name="Monthly Detail" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"></td>
							<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:textbox text="" id="txtTemp2" styles='width:100%' onenterkey="OnSearch(2)" />
							</td>
							<td colspan=2 width="2%" style="border:0">						
							</td>
							<td colspan=10 width="10%" style="border:0" width="12%" align="left" >
								Group
							</td>
							<td colspan=20 style="border:0" width="20%" align="left" >
								<gw:list  id="lstWG2"  maxlen = "100" styles='width:100%' onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0">								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >Month Type</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="idLst_period2" value='01' maxlen = "100" styles='width:100%' onchange="OnChangeMon2()">
									<data> <%=CtlLib.SetListDataSQL("SELECT P.C1,P.C2     FROM(select S.ID C1,A.CHAR_1||'->'||A.CHAR_2 C2      from thr_close s,VHR_HR_CODE A        where s.del_if=0 and a.ID='HR0030'   and s.id=a.code) P   GROUP BY P.C1,P.C2  ORDER BY P.C1")%>|M|By Month</data>
								</gw:list>
							</td>
							<td colspan=4 width="4%"></td>
						</tr>
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(2)" href="#tips" >Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg2"  maxlen = "100" styles='width:100%' onchange="ChangeOrganization(2)" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" width="12%" align="left" >
								Work Date
							</td>
							<td colspan=10 width="10%" style="border:0" align="left">
								<gw:datebox id="idMon_fr2"  lang="<%=Session("Lang")%>" onchange="" />
							</td>
							<td colspan=10 width="10%" style="border:0" align="left">
								<gw:datebox id="idMon_to2"  lang="<%=Session("Lang")%>" onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Work Month
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:datebox id="idWorkMon2" type="month" lang="<%=Session("Lang")%>" onchange="OnChangeMon2()" />
							</td>
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord2"  text="" maxlen = "100"  />
							</td>
							<td colspan=18 width="18%"></td>
							<td colspan=15 width="15%" style="border:0" align="left" >
								<b style="color=#FF00CC; font-size:12"><gw:label id="idRecord" text="" styles="width:100%" ></gw:label></b>
							</td>
							<td colspan=15 width="15%" style="border:0"> 
								<a class="eco_link" title="Click here to work shift information" onclick="OnShowWorkShift()" href="#tips">Shift Info</a>
							</td>
							<td colspan=18 width="18%"></td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch2" alt="Search" img="search" text="Search" onclick="OnSearch(2)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnSave(2)" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt2" alt="Report" img="excel" text="Report" onclick="OnReport(2)" />
							</td>							
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
								id="grdWork2"  
								header="_emp_pk|EMP ID|Full Name|Organization|WGroup|Join date|Left date|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_w_mon|_from|_to
											   |_DT1|_DT2|_DT3|_DT4|_DT5|_DT6|_DT7|_DT8|_DT9|_DT10|_DT11|_DT12|_DT13|_DT14|_DT15|_DT16|_DT17|_DT18|_DT19|_DT20|_DT21|_DT22|_DT23|_DT24|_DT25|_DT26|_DT27|_DT28|_DT29|_DT30|_DT31"   
								format="0|0|0|0|0|4|4|0|0|0|0
									     |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0|0"  
								aligns="0|0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0|0"  
								defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"  
								editcol="0|0|0|0|0|0|0|1|1|1|1
										  |1|1|1|1|1|1|1|1|1|1
										  |1|1|1|1|1|1|1|1|1|1
										  |1|1|1|1|1|1|1|0|0|0
										  |0|0|0|0|0|0|0|0|0|0
										  |0|0|0|0|0|0|0|0|0|0
										  |0|0|0|0|0|0|0|0|0|0|0"
								widths="0|1000|2500|2500|2500|1200|1200|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|500|0|0|0"  
								styles="width:100%; height:100%"   
								sorting="T"  
								acceptNullDate
								onafteredit     = "on_check()" 
								onKeyPressEdit    = "on_save_before()" />
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>

</gw:tab>
<gw:grid   
    id="grdWork3"  
    header="1"   
    format="0"  
    aligns="0"  
    defaults="|"  
    editcol="0"  
    widths="2500"  
    styles="width:100%; height:100%;display:none"   
    sorting="T"   
    />
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtOption" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txt_temp" styles="display:none"/>	
    <gw:textbox id="txt_WS_temp" styles="display:none"/>	
    <gw:textbox id="txt_WG_temp1" styles="display:none"/>	
    <gw:textbox id="txt_WG_temp" styles="display:none"/>	
    <gw:textbox id="txt_Sal_kind" styles="display:none"/>	
    <gw:textbox id="txtOrgPK" styles="display:none"/>
    
    <gw:textbox id="idnum_day2" styles="display:none"/>
	<gw:textbox id="idClose_flag2" styles="display:none"/>
	<gw:textbox id="idResult2" styles="display:none"/>
	<gw:textbox id="idDBUSR" styles="display:none"/>
	<gw:textbox id="txtRecord" styles="display:none"/>
	<gw:textbox id="txtSequence" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
	<gw:textbox id="txtReport_Code" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
	<gw:list  id="lstReport2" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
	<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
</body>
</html>

