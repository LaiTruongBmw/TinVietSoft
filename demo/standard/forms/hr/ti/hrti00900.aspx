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
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit() {
    idGrid.GetGridControl().FrozenCols = 4;
    idGrid.GetGridControl().ScrollTrack = true;
    //if (v_language != "ENG")
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text = "<%=Session("COMPANY_PK")%>";
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI00900', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstReport.SetDataText(data);
    
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('WSHIFT', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWS.SetDataText(data);
	lstWS.value= "ALL";
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	
    do_DisEnable(3);
    //datCheck_View.Call();
    if ((Trim(iduser_pk.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
    {
        datUser_info.Call();
    }
    else
        onChange_org();

}
//------------------------------------------------------------------------------------
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
function do_Enable(n)
{
    if(n==1)
    {
        ibtnSave.SetEnable(1);  
        chkSelectAll.SetEnable(1);
    }
    else if(n==2)
    {
        idRate.SetEnable(1); 
        idBtnSet.SetEnable(1);
        idBtnClear.SetEnable(1);
    }   
    else
    {
        ibtnSave.SetEnable(1);  
        chkSelectAll.SetEnable(1);
        idRate.SetEnable(1); 
        idBtnSet.SetEnable(1);
        idBtnClear.SetEnable(1);
    }
}
//------------------------------------------------------------------------------------
function do_DisEnable(n)
{
    if(n==1)
    {
        ibtnSave.SetEnable(0);  
        chkSelectAll.SetEnable(0);
    }
    else if(n==2)
    {
        idRate.SetEnable(0); 
        idBtnSet.SetEnable(0);
        idBtnClear.SetEnable(0);
    }    
     else
    {
        ibtnSave.SetEnable(0);  
        chkSelectAll.SetEnable(0);
        idRate.SetEnable(0); 
        idBtnSet.SetEnable(0);
        idBtnClear.SetEnable(0);
    }
}
//-------------------------------------------------------------------------------

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
//---------------------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
	var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj
        txtUpperDept.text=obj;
        onChange_org();
    }
    
}
//------------------------------------------------------------------------------------
function OnChangeDept()
{
    //txtDept.text=lstOrg.value;
    //datGroupData.Call();
}
//------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
 /*      if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                ibtnSave.style.display = "none";
            
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	        {
                datUser_info.Call();     	    
	        }
       }    */
       if (obj.id=="datDeptData")
       {
            if(txtHr_level.text=="6")
                txtDeptData.text=txtDeptData.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả";
            lstOrg.SetDataText(txtDeptData.text)    ;
            
              obj=lstOrg.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=0;
            //datGroupData.Call();
       }
       
       else if (obj.id=="datWorkingRate")
       {
           //clear_Interval(idInterval);
           idInterval.text = idGrid.rows - 1;
           if(idGrid.rows>1)
                do_Enable(1);
                
       }
       else if (obj.id=="datUser_info")
       {
            datWorkGroup_info.Call();
       }
       else if (obj.id=="datWorkGroup_info")
       {
			lstWG.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
			lstWG.value='ALL';
           
       }
       else if (obj.id == "datFind_Report") {
           var url = System.RootURL;
           url = url + txtReport_tmp.text +'?p_search='+ idtxtTmp.text +'&p_tco_org_pk=' + lstOrg.value + '&p_group=' + lstWG.value 
		   + '&p_ws=' + lstWS.value + '&p_fromdt=' + dtFromDate.value + '&p_todt=' + dtToDate.value +'&p_lang='+ v_language.value ;           
           window.open(url);
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
//------------------------------------------------------------------------------------
function OnSearch()
{
  //set_Interval(100);  
  datWorkingRate.Call("SELECT");  
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
function change_list()
{
   if(idLstRate.value=="0")
    {
        do_DisEnable(2);
    }
    else
    {
        if(idGrid.rows>1)
            do_Enable(2);
    }
}
//---------------------------------------------------------------
function OnSet_Clear_Grid(act)
{ 
	var gCtrl,i,col;
	gCtrl=idGrid.GetGridControl();	
	switch(idLstRate.value)
	{
	    case '1'://wt
	        col=7;
	        break;
	    case '2':
	        col=9;//ot
	        break;
	    case '3':
	        col=11;//nt
	        break;
	    case '4':
	        col=13;//nt2
	        break;
	    case '5':
	        col=17;
	        break;
		case '6':
	        col=15;
	        break;
	}
    if(gCtrl.SelectedRows>0)
    {
        if(act=='Set')
        { 
            for(i=0;i<gCtrl.SelectedRows;i++)
	        {
			    var tmp=gCtrl.SelectedRow(i);	
			    if(idGrid.GetGridData(tmp,col-1)!="")
			        idGrid.SetGridData(tmp,col,idRate);	
    				
		    }
		 }
		else //Clear 
		 for(i=0;i<gCtrl.SelectedRows;i++)
	        {
			    var tmp=gCtrl.SelectedRow(i);	
			        idGrid.SetGridText(tmp,col,'');	
    				
		    }
		    
    }
}
//------------------------------------------------------------------------------------
function OnUpdate()
{
    if(confirm((v_language =="ENG")?"Do you want to save?":"Bạn đã chắc chắn lưu dữ liệu?"))
        datWorkingRate.Call();
}
//------------------------------------------------------------------------------------

function OnReport()
{
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();
}
function onChange_org()
{
    //if(lstOrg.value!='ALL')
        datWorkGroup_info.Call();
}
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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

<gw:data id="datWorkingRate" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,9,11,13,15,17,18,19,20,21,22,23,24" function="ST_HR_SEL_HRTI00900_0" procedure="ST_HR_UPD_HRTI00900_0"> 
                <input bind="idGrid" >
                    <input bind="lstOrg" />
                    <input bind="lstWS" />
                    <input bind="dtFromDate" />
                    <input bind="dtToDate" />
                    <input bind="idtxtTmp" />
                    <input bind="lstWG" />
                </input>
                <output  bind="idGrid" />
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

	<table id="expand" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" align="top" class="eco_line">
	    <tr style="width:100%;height:100%" valign="top">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										Employee
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 style="border:0" width="10%" align="left" >
										Group
									</td>
									<td colspan=20 style="border:0" width="20%"  align="left" >
										<gw:list id='lstWG' style='width:100%' value='ALL' />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >Work Shift</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstWS" value="ALL"  maxlen = "100" styles='width:100%' onchange="" />
									</td>
								</tr>
								<tr style="border:0.5;width:100%;height:4%" valign="center" >
									<td colspan=2 width="2%" style="border:0" align="left"   >
										<gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll(chkSelectAll,idGrid)" ></gw:checkbox >
									</td>
									<td colspan=10 width="10%" style="border:0" align="left" >
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstOrg"  value="ALL" styles='width:100%' onchange="onChange_org()" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
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
									<td colspan=10 style="border:0" width="10%" align="left" >
										Working Rate
									</td>
									<td colspan=7 width="7%" style="border:0" align="left">
										<gw:list id="idLstRate"  styles="width:100%" value="0" onchange="change_list()"><data>|0|Choose...|1|WT Rate|2|OT Rate|3|NT Rate|4|NT2 Rate|5|HT Rate|6|NT3 Rate</data></gw:list >
									</td>
									
									<td colspan=7 width="7%" style="border:0" align="left">
										<gw:textbox id="idRate" maxlen = "3" styles="width:100%" onkeypress="return Numbers(event)" onenterkey="OnSet_Clear_Grid('Set')" />
									</td>
									<td colspan=3 width="3%" style="border:0" align="left">
										<gw:button id="idBtnSet"  styles='width:90%' img="Set"  text="Set"  onclick="OnSet_Clear_Grid('Set')"/>
									</td>
									<td colspan=3 width="3%" style="border:0" align="left">
										<gw:button id="idBtnClear"  styles='width:90%' img="Clear"  text="Clear"  onclick="OnSet_Clear_Grid('Clear')"/>
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
								<gw:label id="idInterval" text="" ></gw:label>
							</td>
							<td colspan=71 width="71%" style="border:0" align="left" >								 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
							</td>
							<td colspan=5 width="5%"  style="border:0" align="left" >
								<gw:button id="ibtnSave" alt="Save" img="save"  text="Save" onclick="OnUpdate()" />
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnRpt" alt="Report" img="excel" text="Report" onclick="OnReport()" />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:97%;width=100%" border=0>
						<tr style="height:96%">
							<td  class="eco_line_t">
								<gw:grid
									id="idGrid"
									header="_EMP_PK|ORGANIZATION|EMP_ID|FULL_NM|WORK SHIFT|WORK DT|WT|WT RATE(%)|OT|OT RATE(%)|NT|NT RATE(%)|NT2|NT2 RATE(%)|ST|ST RATE(%)|HT|HT RATE(%)|_WKD_PK|_OT_PK|_NT_PK|_NT2_PK|_NT3_PK|_HT_PK|_WD_TEMP"
									format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
									aligns="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
									defaults="||||||||||||||||||||||||"
									editcol="0|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|0|1|0|0|0|0|0|0|0"
									widths="0|1500|1000|2500|5000|1400|500|1200|500|1200|500|1200|500|1200|500|1200|500|1200|500|800|500|800|0|0|0"
									styles="width:100%;height:100%"
									sorting="T" autosize=true
									onafteredit=""
									oncellclick = ""
									acceptNullDate="T"
									oncelldblclick = ""/>
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
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtCompany_pk" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>    	
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtReport_tmp" text="" styles="display:none"  />
	<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
</body>
</html>

