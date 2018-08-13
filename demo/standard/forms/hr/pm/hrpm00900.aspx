<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var strcodereturn;
var v_language = "<%=Session("SESSION_LANG")%>";
var user='';

function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user="<%=session("USER_ID")%>";
    
    grdDetail.SetComboFormat(13,"<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0017'  union  all select 'ALL','Select ALL' from dual  ")%>");
    grdDetail.SetComboFormat(14,"<%=CtlLib.SetGridColumnDataSQL("select to_char(pk),org_nm from tco_org where del_if=0  union  all select 'ALL','Select ALL' from dual  ")%>");
    grdDetail2.SetComboFormat(3,"<%=CtlLib.SetGridColumnDataSQL("select a.CODE,a.CODE_NM from vhr_hr_code a where a.id='HR0001' order by a.code  ")%>");
	
    grdDetail2.SetComboFormat(4,"#Y;Only Pay|#N;No Pay|#U;Unused ");
    grdBonusAMT.SetComboFormat(13,"#Y;Yes|#N;No");
    grdBonusAMT.GetGridControl().FrozenCols =4;
    grdBonusAMT.GetGridControl().ScrollTrack=true;
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00900', 2) FROM DUAL")%>";
    lstReport.SetDataText(data);
    dtTo_P.SetEnable(0);
	tr_month.style.display="none";	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0057', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstTimes.SetDataText(data);
    lstTimes_P.SetDataText(data);
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('COMPANY', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstCompany.SetDataText(data);
    lstCompany2.SetDataText(data);
   
    ddata = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg_Code.SetDataText(data);
    lstOrg_Code.value ="ALL";
	ChangeColorItem(lstOrg_Code.GetControl());
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstWorkGroup.SetDataText(data);
    lstWorkGroup.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstNation.SetDataText(data);
    lstNation.value ="01";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstEmp_Type.SetDataText(data);
    lstEmp_Type.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstContract_Type.SetDataText(data);
    lstContract_Type.value ="ALL";
    
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}
	else
	{
	    datUser_info2.Call();
	}
}
function ChangeLocation()
{datUser_info2.Call("SELECT");    
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
//-------------------------------------------------
function OnShowPopup()
{
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
             lstOrg_Code.value=obj;
             
        }
}
//----------------------------------------------------
function ChoseList_box(obj_list,value)
{
}
//----------------------------------------------
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
function clock(start,x) 
{
 var d = new Date()
 

}
//------------------------------------------------------------------------------------

function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
function Active_Button(obj)
{   if(active_page==0||active_page==-1)
    {idStatus.text=(txtClose.text=='0')? 'Status: Open':(txtClose.text=='1')?'Status: Close.':'Status: Undefine' ;   
    if(obj=='1')
        {idAdd.SetEnable(0);
        idDel.SetEnable(0);
        idSave.SetEnable(0);idSave2.SetEnable(0);
        dtTo.SetEnable(0);
        btClose.SetEnable(1);
        //btClose.text=' Open '; 
        }
        else 
        if(obj=='-1')
        {dtTo.SetEnable(1); idAdd.SetEnable(0);
        idDel.SetEnable(0);
        idSave.SetEnable(0);idSave2.SetEnable(1);
        btClose.SetEnable(0);
        //btClose.text='Undefine';
        }
        else
        {dtTo.SetEnable(1);
        idAdd.SetEnable(1);
        idDel.SetEnable(1);
        idSave.SetEnable(1);idSave2.SetEnable(1);
          btClose.SetEnable(1);
        //btClose.text=' Close ';
        }
         
    }  
    else
    {  if(obj=='1')
            {ibtnSave_B.SetEnable(0);btProcess.SetEnable(0);btDelete.SetEnable(0);}
       else if(obj=='-1')
            {btProcess.SetEnable(0);btDelete.SetEnable(0);ibtnSave_B.SetEnable(0);}
        else {ibtnSave_B.SetEnable(1);btProcess.SetEnable(1);btDelete.SetEnable(1);}   
    }
    

	
}
//----------------------------------------------
function OnDataReceive(obj) {
    if (obj.id == "datUser_info") {
        lstCompany.SetDataText(txt_temp.text);
        lstCompany2.SetDataText(txt_temp.text);
		
        active_page = -1;
        datUser_info2.Call();
    }
    if (obj.id == "datUser_info2") 
	{ // alert(txt_temp.text + " >>"+ active_page);
        if (active_page == 1) {
            lstOrg_Code.SetDataText(txt_temp.text);
			ChangeColorItem(lstOrg_Code.GetControl());
            datCheckClose.Call();
        }
        if (active_page == 0 || active_page == -1) {
            if (active_page == -1)
                lstOrg_Code.SetDataText(txt_temp.text);
				ChangeColorItem(lstOrg_Code.GetControl());
            var arr = txt_temp.text.replace("DATA|", '').split("|");
            var s = "";
            //alert(arr);
            var t = 0;
            for (var i = 0; i < (arr.length + 1) / 2 - 1; i++) {
                s = s + "#" + arr[t] + ";" + arr[t + 1] + "|";
                t = t + 2;
                //alert(s);
            }
            //alert(s);
            grdDetail.SetComboFormat(14, s);
            datSelectBonusMaster.Call();

        }
    }
    if (obj.id == 'datCheckClose')
        Active_Button(txtClose.text);
    if (obj.id == 'datBonusDetail') {
        auto_resize_column(grdDetail, 0, grdDetail.cols - 1, 0);
        for (var i = 1; i <= grdDetail.rows - 1; i++)
            grdDetail.SetCellBgColor(i, 9, i, 12, 0xFFCC00);

    }
    if (obj.id == 'datUpdateBonusMaster') {
        datSelectBonusMaster.Call();
    }
    if (obj.id == 'datSelectBonusMaster') {
        if (grdDetail2.rows == 1) {
            grdDetail2.AddRow();
            grdDetail2.AddRow();
            grdDetail2.AddRow();
        }
        grdDetail2.SetGridText(1, 0, 'Join Date');
        grdDetail2.SetGridText(1, 1, txtFromJ.text);
        grdDetail2.SetGridText(1, 2, txtToJ.text);
        grdDetail2.SetGridText(1, 4, txtOptionJ.text);
        grdDetail2.SetGridText(2, 0, 'Left Date');
        grdDetail2.SetGridText(2, 1, txtFromL.text);
        grdDetail2.SetGridText(2, 2, txtToL.text);
        grdDetail2.SetGridText(2, 4, txtOptionL.text);
        grdDetail2.SetGridText(3, 0, 'Contract Type');
        grdDetail2.SetGridText(3, 3, txtContractType.text);
        grdDetail2.SetGridText(3, 4, txtOptionC.text);
        grdDetail2.SetCellBgColor(1, 3, 1, 3, 0x0000FF);
        grdDetail2.SetCellBgColor(2, 3, 2, 3, 0x0000FF);
        grdDetail2.SetCellBgColor(3, 1, 3, 2, 0x0000FF);
        Active_Button(txtClose.text);
        datBonusDetail.Call('SELECT');

    }
    if (obj.id == 'datClose')
        Active_Button(txtClose.text);
    if (obj.id == 'datProcess') {
        if (txtResult.text == '1')
            alert("Bonus processing completed!\nQuá trình tính thưởng hoàn tất!")
        else
            alert("Bonus processing met error!Please contact with admin \nQuá trình tính thưởng đã gặp lỗi!Vui lòng liên hệ admin!")
    }
    if (obj.id == 'datUnProcess') {
        if (txtResult.text == '1')
            alert("Delete bonus completed!\nQuá trình xóa bảng thưởng hoàn tất!")
        else
            alert("Delete bonus met error!Please contact with admin \nQuá trình xóa đã gặp lỗi!Vui lòng liên hệ admin!")
    }
    if (obj.id == 'datBonusAMT') {
        auto_resize_column(grdBonusAMT, 0, grdBonusAMT.cols - 1, 0);
        for (var i = 1; i <= grdBonusAMT.rows - 1; i++)
            grdBonusAMT.SetCellBgColor(i, 11, i, 12, 0xFFCC00);

        idRecord.text = grdBonusAMT.rows - 1;
    }
    if (obj.id == 'datFind_Report') {
        var url = System.RootURL;

        switch (txtReportCode_tmp.text) {
            case "232":
                url = url + txtReport_tmp.text + '?l_tco_org=' + lstOrg_Code.value + '&l_wgroup=' + lstWorkGroup.value + '&l_year=' + dtYear_P.value + '&l_bn_times=' + lstTimes_P.value + '&l_emp_type=' + lstEmp_Type.value;
                url = url + '&l_nation=' + lstNation.value + '&l_contract=' + lstContract_Type.value + '&l_Temp=' + txtTemp.text + '&l_j_from=' + dtJoinFrom.value + '&l_j_to=' + dtJoinTo.value + '&l_l_from=' + dtLeftFrom.value;
                url = url + '&l_l_to=' + dtLeftTo.value + '&l_Senority_from=' + txtSenForm.text + '&l_Senority_to=' + txtSenTo.text + '&l_type=' + lstType.value;
                break;
        }
        
        window.open(url);
    }



}
//------------------------------------------------
function OnChangeDept(deptobj)
{
   
}
//------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-----------------------------------------------
function OnReport()
{
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg_Code.value;
    datFind_Report.Call();
}

//-----------------------------------------------
function OnSearch()
{datBonusAMT.Call('SELECT');
}

//-----------------------------------------------------
function OnSave(obj)
{
if(obj=='1'&& OnCheck(1)==1)
  return; 
if(obj=='2'&& (lstOption.value=='1'||lstOption.value=='2') && dtMonth.value=='')
{alert("Please input month salary you want to include bonus amount!\n Vui lòng nhập vào tháng lương mà bạn muốn đưa tiền thưởng vào tính ");
return;
}
if(confirm("Do you want to save? \n Bạn có muốn lưu lại không?") )
        {if(obj=='1')
         {   
                datBonusDetail.Call();
         }
        if(obj=='2')
        {
        
      txtFromJ.text= grdDetail2.GetGridData(1,1);
      txtToJ.text= grdDetail2.GetGridData(1,2);
      txtOptionJ.text=grdDetail2.GetGridData(1,4);
      
      txtFromL.text=grdDetail2.GetGridData(2,1);
      txtToL.text=grdDetail2.GetGridData(2,2);
      txtOptionL.text=grdDetail2.GetGridData(2,4);
           
      txtContractType.text=grdDetail2.GetGridData(3,3);
      txtOptionC.text=grdDetail2.GetGridData(3,4);
      
          datUpdateBonusMaster.Call();
        }
        if(obj=='3')
        {   datBonusAMT.Call();
        }
    }
}
//-----------------------------------------------------
function OnOption(option,obj,vdtMonth,vlstQuarter,vdtYear,vdtFromDate,vdtToDate)
{
}
//----------------------------------------
function ShowDetail(grd_obj,emp_pk_obj)
{
}
//----------------------------------
function OnCal_ALL()
{
}
//----------------------------------
var active_page=-1;
function onPage_active()
{ if(active_page==1)
    {active_page=0;
    }
  else
  if(active_page==0)
    {active_page=1;
    }
    
    if(active_page==-1)
    {active_page=1;
    datCheckClose.Call();
    }
   
   
    
}
//------------------------------------
function OnCal_Break_Contract()
{
 
}

function OnSetGrid()
{   var ctrl,i
	ctrl=grdBonusAMT.GetGridControl();
	if(ctrl.SelectedRows>0 )
		for(i=0;i<ctrl.SelectedRows;i++)
    		grdBonusAMT.SetGridText(ctrl.SelectedRow(i),12,txtAmount.text);    
}

function OnChangeTimes()
{   if(active_page==0||active_page==-1)
   { 
   datSelectBonusMaster.Call();
   }
    else
    datCheckClose.Call();
}

function OnAdd()
{grdDetail.AddRow();
//alert (grdDetail.rows);
var tmp=txtBonusMasterPK.text ;//dtYear.value;
//alert(tmp);
grdDetail.SetGridText(grdDetail.rows-1,1,tmp);
tmp=lstTimes.value;
grdDetail.SetGridText(grdDetail.rows-1,2,tmp);
 grdDetail.SetCellBgColor(grdDetail.rows-1,9,grdDetail.rows-1,12,0xFFCC00);
}

function OnDelete(obj)
{if(confirm("Do you want to delete?\nBạn đã chắc chắn delete?"))    
     {if(obj==1)
         grdDetail.DeleteRow();
     else
        datUnProcess.Call();
      }  
}
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}

function OnProcess()
{
    if(confirm('Do you want to process bonus?\nBạn có muốn bắt dầu quá trình tính thưởng không !'))
    {set_Interval(100); 
    datProcess.Call();
    }
}
//---------------------------------------
function OnCheck(obj)
{
 if(obj==1)
    {for(var i=1;i<= grdDetail.rows-1;i++)
        {
          if( (Number(grdDetail.GetGridData(i,4)) > Number( grdDetail.GetGridData(i,5))&&  grdDetail.GetGridData(i,5)!='')   ||( grdDetail.GetGridData(i,4)=='' &&  grdDetail.GetGridData(i,5)=='')   || Number(grdDetail.GetGridData(i,4))<0 || Number( grdDetail.GetGridData(i,5))< 0  )        
                {  alert("You input incorrect data in From ,To column at Row "+i +".\nBạn nhập dữ liệu không đúng ở cột From, To  ")
                    grdDetail.SetGridText(i,4,'');grdDetail.SetGridText(i,5,'');                
                return 1;
                }
            if((grdDetail.GetGridData(i,6)!='' && grdDetail.GetGridData(i,7)!='')||(grdDetail.GetGridData(i,6)=='' && grdDetail.GetGridData(i,7)=='') ) 
                {alert("You choose Month Salary or Amount at Row "+i +".\nBạn chỉ được chọn lương tháng hoặc nhập giá trị thưởng khác")
                grdDetail.SetGridText(i,7,'');        
                return 1;
                }
          
            if( grdDetail.GetGridData(i,9)=='-1' && (Number(grdDetail.GetGridData(i,10))< 0 || grdDetail.GetGridData(i,10)=='') ) 
                {alert("You must input Divisor greater than zero at row "+i +".\nBạn phải nhập số chia lớn hơn 0 ở cộ Divisor!")
                grdDetail.SetGridText(i,10,'');        
                return 1;
                }
            if( grdDetail.GetGridData(i,9)!='-1' && (grdDetail.GetGridData(i,11)!=''||grdDetail.GetGridData(i,10)!=''||grdDetail.GetGridData(i,12)!='') )
            {alert ("You must input null at Min, Max amount and Divisor column at row "+i +" when you don't use Seniority Ratio.\nBạn phải để trống các cột Min, Max amount và Divisor khi bạn không sử dụng cách tính theo tỉ lệ!")
             grdDetail.SetGridText(i,11,''); 
             grdDetail.SetGridText(i,12,'');
             grdDetail.SetGridText(i,10,'');                       
             return 1;   
            } 
            if( grdDetail.GetGridData(i,9)=='-1' ) 
                {  if(grdDetail.GetGridData(i,11)!='' && Number(grdDetail.GetGridData(i,11))< 0 )
                       { alert("You must input numberic or null at Min amount column at row "+i +".\nBạn phải nhập số hoặc để trống ở cột Min Amount!")
                                grdDetail.SetGridText(i,11,'');        
                        return 1;
                        }
                  if(grdDetail.GetGridData(i,12)!='' && Number(grdDetail.GetGridData(i,12))< 0 )
                       { alert("You must input numberic or null at  Max Amount colunm at row "+i +".\nBạn phải nhập số hoặc để trống ở cột Max Amount!")
                                grdDetail.SetGridText(i,12,'');        
                        return 1;
                        }
                  if(grdDetail.GetGridData(i,12)!=''&& grdDetail.GetGridData(i,11)!='' &&  (Number(grdDetail.GetGridData(i,11))> Number(grdDetail.GetGridData(i,12))))          
                        { alert("You must input numberic at Max Amount greater than Min Amount at row "+i +".\nBạn phải nhập Max Amount lớn hơn Min Amount hoặc để trống!")
                                grdDetail.SetGridText(i,12,'');        
                        return 1;
                        }
                        
                
                }        
        }
     }
 if(obj==2)
   {
   if(grdDetail2.GetGridData(grdDetail2.row,4)=='U' && grdDetail2.row==1)
        {       
           grdDetail2.SetGridText(1,1,'');grdDetail2.SetGridText(1,2,'');
        }
      if(grdDetail2.GetGridData(grdDetail2.row,4)=='U' && grdDetail2.row==2)
        {grdDetail2.SetGridText(2,1,'');grdDetail2.SetGridText(2,2,'');
        }
     if(grdDetail2.GetGridData(grdDetail2.row,4)=='U' && grdDetail2.row==3)
        {grdDetail2.SetGridText(3,3,'');
        }     
        grdDetail2.SetGridText(1,3,'');
        grdDetail2.SetGridText(2,3,'');
        grdDetail2.SetGridText(3,2,'');grdDetail2.SetGridText(3,1,'');
    return 1;            
   }
    
      return 0;  
}
function OnChangeDate()
{
   
    
}
function OnClose()
{    if(confirm('Do you want to close bonus formular?\nBạn có muốn đóng công thức thưởng không!'))
        datClose.Call();
        
}
function OnChangOption()
{if((lstOption.value=='1'||lstOption.value=='2') && dtMonth.value=='')
    alert("Please input month salary you want to include bonus amount!\n Vui lòng nhập vào tháng lương mà bạn muốn đưa tiền thưởng vào tính ");

if(lstOption.value=='3')
    {dtMonth.value='';//dtMonth.text='';
    
    }
    

}


function OnDeleteDetail()
{
    if(confirm("Do you want to delete?" + "\n" + "Bạn có muốn xóa không?"))
    {
        grdBonusAMT.DeleteRow();
        datBonusAMT.Call();
    }
}
function OnToggle()
{
    
	if(img2.status == "show")
	{
		img2.status = "hide";
		img2.src = "../../../../system/images/close_popup.gif";
		img2.alt="Hide month salary information";
		tr_month.style.display='';
	}
	else 
	{
		img2.status = "show";
		img2.src = "../../../../system/images/iconmaximize.gif";
		img2.alt="Show month salary information";
		tr_month.style.display="none";
	}
}

</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!----------------------------------------------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_PRO_CO_COMPANY_USER"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txt_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datSelectBonusMaster" onreceive="OnDataReceive(this)"  > 
        <xml> 
              <dso  type="process" procedure="ST_HR_SEL_HRPM00900_0" > 
                <input>
                    <input bind="dtYear" />
                    <input bind="lstTimes" />                                       
					<input bind="lstCompany" />                                       
                </input> 
                <output>
                    
					
					<output bind="txtBonusMasterPK" />
                    <output bind="txtRemark" />
                    <output bind="dtTo" />
                    <output bind="lstUnit" />
                    <output bind="lstOption" />
                    <output bind="dtMonth" />
                    <output bind="txtOptionJ" />
                    <output bind="txtFromJ" />
                    <output bind="txtToJ" />
                    <output bind="txtOptionL" />
                    <output bind="txtFromL" />
                    <output bind="txtToL" />
                    <output bind="txtOptionC" />
                    <output bind="txtContractType" />
                    <output bind="txtClose" />
               </output>
            </dso> 
        </xml> 
</gw:data>

<!----------------------------------------------------------->
<!----------------------------------------------------------->
<gw:data id="datUpdateBonusMaster" onreceive="OnDataReceive(this)" > 
        <xml> 
              <dso  type="process" procedure="ST_HR_UPD_HRPM00900_0" > 
                <input>
                    <input bind="dtYear" />
                    <input bind="lstTimes" />
					<input bind="lstCompany" />  
                    <input bind="txtBonusMasterPK" />
                    <input bind="txtRemark" />
                    <input bind="dtTo" />
                    <input bind="lstUnit" />
                    <input bind="lstOption" />
                    <input bind="dtMonth" />
                    <input bind="txtOptionJ" />
                    <input bind="txtFromJ" />
                    <input bind="txtToJ" />
                    <input bind="txtOptionL" />
                    <input bind="txtFromL" />
                    <input bind="txtToL" />
                    <input bind="txtOptionC" />
                    <input bind="txtContractType" />
                    
               </input> 
                <output>
                    <output bind="txtClose" />
               </output>
            </dso> 
        </xml> 
</gw:data>

<!----------------------------------------------------------->

<gw:data id="datClose" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00900_0" > 
                <input>
                   <input bind="dtYear" />
                   <input bind="lstTimes" />
				   <input bind="lstCompany" />  
                   <input bind="txtClose" />
                </input> 
                <output>                    
                    <output bind="txtClose" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datCheckClose" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00900_1" > 
                <input>
                    <input bind="dtYear_P" />
                    <input bind="lstTimes_P" />
					<input bind="lstCompany2" />
                                       
                </input> 
                <output>                    
                    <output bind="txtClose" />
                    <output bind="dtTo_P" /> 
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00900_2" > 
                <input>
                    <input bind="dtYear_P" />
                    <input bind="lstTimes_P" />
                    <input bind="lstCompany2" />
					<input bind="textExchange" />
					<input bind="dtTo_P" />     
						
				    				
                </input> 
                <output>
                   <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datUnProcess" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00900_3" > 
                <input>
                    <input bind="dtYear_P" />
                    <input bind="lstTimes_P" />
                    <input bind="lstCompany2" />
                </input> 
                <output>
                   <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>


<gw:data id="datUser_info2" onreceive="OnDataReceive(this)"  > 
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
<!------------------------------------------------>
<gw:data id="datBonusDetail" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" function="ST_HR_SEL_HRPM00900_1" procedure="ST_HR_UPD_HRPM00900_1"> 
                <input bind="grdDetail" >
                    <input bind="txtBonusMasterPK" />
                    
                </input>
                <output  bind="grdDEtail" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------>

<gw:data id="datBonusAMT"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,3,9,11,12,13" function="ST_HR_SEL_HRPM00900_2" procedure="ST_HR_UPD_HRPM00900_2"> 
                <input bind="grdBonusAMT" >
                    <input bind="dtYear_P" />
                    <input bind="lstTimes_P" />
                    
                    <input bind="dtTo_P" />
                    <input bind="lstOrg_Code" />
                    <input bind="lstEmp_Type" />
                    <input bind="lstWorkGroup" />
                    <input bind="lstNation" />
                    <input bind="lstContract_Type" />
                    <input bind="txtTemp" />
                    <input bind="dtJoinFrom" />
                    <input bind="dtJoinTo" />
                    <input bind="dtLeftFrom" />
                    <input bind="dtLeftTo" />
                    <input bind="lstType" />
                    <input bind="txtSenForm" />
                    <input bind="txtSenTo" />
                </input>
                <output  bind="grdBonusAMT" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>

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

<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="onPage_active()" >
   <table name="Bonus Formula " cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;" class="eco_line">
		<tr>
			<td>
				<div style="width:100%;height:4%;" class="eco_bg">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0" align="left" >Year</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:datebox styles="width:10%" lang="<%=Session("Lang")%>"  id="dtYear" type="year"  onchange="OnChangeTimes()" />
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Times
							</td>
							<td colspan=15 width="15%" style="border:0" align="left" >
								<gw:list  id="lstTimes" value='ALL' maxlen = "100" styles='width:100%'onchange="OnChangeTimes()" />
							</td>
							<td colspan=20 width="20%" style="border:0" align="left" >
							    <table style="height:100%" border="0" cellpadding="2" cellspacing="1">
							        <tr>
							            <td><gw:button img="save" id="idSave2"  text="Save"  alt="save"  onclick="OnSave(2)"/></td>
							            <td><gw:button id="btClose" styles="widh:100%"  img="lock"  text="Open"  onclick="OnClose()"/></td>
							        </tr>
							    </table>
							</td>
							<td colspan=20 width="20%" style="border:0" align="left" >
								
							</td>
						</tr>
					</table>
				</div>
				<div style="width:100%;height:13%" class="eco_line_t">
					<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Company
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								 <gw:list  id="lstCompany"  maxlen = "100" styles='width:100%'onchange="ChangeLocation()" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Seniority to
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:datebox styles="widh:100%"  lang="<%=Session("Lang")%>"  nullaccept  id="dtTo" type="date"  onchange="OnChangeDate()" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Use Unit
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstUnit" value='2' maxlen = "100" styles='width:100%' onchange="" >
									<data>
										|1|Day|2|Month|3|Year
									</data>
								</gw:list>
							</td>
						</tr>
						<tr style="border:0.5;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 width="12%" style="border:0"  align="left" >
								Option
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstOption" value='2' maxlen = "100" styles='width:100%' onchange="OnChangOption()" >
									<data>
										|1|Month Salary|2|Income Tax |0|Select All
									</data>
								</gw:list>
							</td>
								
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=12 style="border:0" width="12%" align="left" >
								Month
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:datebox styles="widh:100%"  lang="<%=Session("Lang")%>"  nullaccept  id="dtMonth" type="month"  onchange="" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Remark
							</td>
							<td colspan=15 width="15%" style="border:0"> 
								<gw:textbox styles="widh:100%"  lang="<%=Session("Lang")%>"    id="txtRemark" type="date"  />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idStatus" text="" styles="width:100%;color:red;display:none" ></gw:label>
							</td>
						</tr>
					</table>
				</div>
				<div style="width:100%;height:30%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
                        <tr style="width:100%;height:75%" valign="top">
                            <td colspan=100 style="width:100%;height:100%;"> 
                                 <gw:grid id="grdDetail2" 
							    header="Condition Name|From date|To date|Contract  type|Option" 
							    format="0|4|4|0|0" 
							    aligns="0|1|1|1|1" 
							    defaults="||||" 
							    editcol="1|1|1|1|1" 
							    widths="2000|2000|2000|2000|2000" 
							    styles="width:100%; height:100%" 
							    sorting="F" acceptNullDate 
							    onafteredit="OnCheck(2)" />	 
                            </td>
                        </tr>
					</table>
				</div>	
				<div style="width:100%;height:5%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:1;width:100%;height:75%" valign="top">
							<td style="width:82%;border:0" align=left></td>
							<td colspan=1  align=right style="width:2%;border:0" ><gw:button img="new" id="idAdd"  text="Add New"  alt="Add new Range"  onclick="OnAdd()"/></td>    
							<td colspan=1  align=right style="width:2%;border:0" ><gw:button img="save" id="idSave"  text="Save"  alt="save"  onclick="OnSave(1)"/></td>
							<td colspan=1  align=right style="width:2%;border:0" ><gw:button img="delete" id="idDel"  text="Delete"  alt="Delete"  onclick="OnDelete('1')"/></td>    
							<td colspan=1   align=left style=" border:0;width:2%;white-space:nowrap"></td>     
						</tr>
					</table>
				</div>
				<div style="width:100%;height:45%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:1;width:100%;height:75%" valign="top">
							<td colspan=100 style="width:100%;height:100%;"> 
								 <gw:grid id="grdDetail" 
								header="_pk|_p_master_pk|_times|Seq|From(>)|To(<=)|Month Salary|Amount|Rate|Seniority Ratio|Divisor|Min Amount|Max Amount|Employee Type|Organization" 
								format="0|0|0|0|1|1|2|1|1|3|1|1|1|0|0" 
								aligns="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1" 
								defaults="||||||||||||||" 
								editcol="0|0|0|1|1|1|1|1|1|1|1|1|1|1|1" 
								widths="1500|0|0|1000|2000|2000|1500|1000|2000|2000|2000|2000|2000|2000|2000" 
								styles="width:100%; height:100%" 
								sorting="T" acceptNullDate 
							   onafteredit="" />
							</td>
						</tr>
					</table>
				</div>	
			</td>
		</tr>
    </table>
    <table name="Process Bonus" cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;" class="eco_line">
        <tr>
            <td>				
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:15%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%" id="tblexp" style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0" align="left"> 
										<gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Employee Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstEmp_Type" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Nation</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										 <gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Join Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtJoinFrom" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtJoinTo" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
									
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Amount
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstType" value='>0' maxlen = "100" styles='width:100%' >
										<data>LIST|>0|>0|=0|=0|ALL|Select All</data></gw:list>
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 style="border:0" width="12%" align="left" >
										Contract Type
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:list  id="lstContract_Type" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=12 width="12%" style="border:0"  align="left" >
										Left Date
									</td>
									<td colspan=20 width="20%" style="border:0" align="left">
										<gw:datebox id="dtLeftFrom" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtLeftTo" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>														
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										Seniority
									</td>
									<td colspan=9 width="9%" style="border:0"> 
										<gw:textbox id="txtSenForm"     styles='width:100%'/>
									</td>
									<td colspan=2 width="2%" style="border:0" align="center"> 
										~
									</td>
									<td colspan=9 width="9%" style="border:0"> 
										 <gw:textbox id="txtSenTo"   styles='width:100%'/>
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div id="tr_month" style="width:100%;height:4%" >
					<table style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr style="border:0;height:4%" valign="center" >
						    <td colspan=2 width="2%" style="border:0"   ></td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Company
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" > 
								<gw:list  id="lstCompany2" onchange="ChangeLocation()"  maxlen ="100" style="width:100%" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Year
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:datebox styles="width:10%" lang="<%=Session("Lang")%>"  id="dtYear_P" type="year"  onchange="OnChangeTimes()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Times
							</td>
							<td colspan=7 width="7%" style="border:0" align="left" >
								<gw:list  id="lstTimes_P" value='ALL' maxlen = "100" styles='width:100%'onchange="OnChangeTimes()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								Seniority
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:datebox styles="width:100%" lang="<%=Session("Lang")%>"  id="dtTo_P" type="date" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="center" >
								EX rate
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:textbox text="" id="textExchange" styles='width:100%'  />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
							</td>
							<td colspan=7 width="7%" style="border:0" >
								<gw:button id="btProcess"   styles='width:100%' img="process"  text="Process"  onclick="OnProcess()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" >
								<gw:button id="btDelete"   styles='width:100%' img="delete"  text="Delete"  onclick="OnDelete(2)"/>
							</td>
							<td colspan=3 width="3%" style="border:0"  >
							</td>
						</tr>
					</table>
				</div>
                <div style="width:100%;height:4%" >
					<table style="height:100%" border="0" cellpadding="2" cellspacing="1">
					    <!--fyzas-->
						<tr style="border:0" valign="center" >
							<td colspan=2 width="2%" style="border:0">
								<img status="show" id="img2" alt="Show more information" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle()"  />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="idRecord"  text="" maxlen = "100"  />
							</td>
							<td colspan=60 width="60%" style="border:0" align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch_B"  text="Search" alt="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" id="ibtnSave_B"  text="Save"  alt="Save"  onclick="OnSave(3)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="delete" id="ibtnDelete" text="Delete"  alt="Delete"  onclick="OnDeleteDetail()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="excel" id="ibtnPrinter_B" text="Report"   alt="Report"  onclick="OnReport()"/>
							</td>						
						</tr>						
					</table>
				</div>
				<div style="width:100%;height:80%" class="eco_line_t">
					<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid id="grdBonusAMT" 
					        header="_bn_pk|_emp_pk|_year|_Times|Organization|Emp ID|Full Name|Join Date|Left Date|Seniority |Ratio|Salary|Bonus Amount|By Hand" 
					        format="0|0|0|0|0|0|0|4|4|1|1|1|1|0" 
					        aligns="0|0|0|0|0|0|0|0|1|1|1|1|1|1" 
					        defaults="|||||||||||||" 
					        editcol="0|0|0|0|0|0|0|0|0|0|0|1|1|1" 
					        widths="0|0|0|0|1500|2000|1500|1500|2000|1500|1500|1500|1500|1500" 
					        styles="width:100%; height:100%" 
					        sorting="T" acceptNullDate 
					        oncelldblclick="" />
                        </td>
                    </tr>
					</table>
				</div>
            </td>
        </tr>
    </table>
</gw:tab>
</body>
<gw:textbox id="txtClose" styles="display:none"/>
<gw:textbox id="txtDateFrom" styles="display:none"/>
<gw:textbox id="txtDateTo" styles="display:none"/>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtDept_PK" styles="display:none"/>
<gw:textbox id="txtOption" text="1" styles="display:none"/> 
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtTemp1" styles="display:none"/>
<gw:textbox id="txtTemp2" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none" text="0"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtOptionJ" styles="display:none"/>
<gw:textbox id="txtFromJ" styles="display:none"/>
<gw:textbox id="txtToJ" styles="display:none"/>
<gw:textbox id="txtOptionL" styles="display:none"/>
<gw:textbox id="txtFromL" styles="display:none"/>
<gw:textbox id="txtToL" styles="display:none"/>
<gw:textbox id="txtOptionC" styles="display:none"/>
<gw:textbox id="txtContractType" styles="display:none"/>
<gw:textbox id="txtBonusMasterPK" styles="display:none"/>
<gw:textbox id="txt_temp" styles="display:none"/>	
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:list  id="lstWorkGroup" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstReport" value='' maxlen = "100" styles='width:100%;display:none' />
</html>
