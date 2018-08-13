<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Request Management Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var dt_tmp ;

var g1_pk = 0,
    g1_slip_no =1,
    g1_applicant = 2,
    g1_approver = 3, 
    g1_organization = 4,  
    g1_employee = 5,
    g1_period = 6,
    g1_start_dt = 7,
    g1_end_dt = 8,
    g1_app_num = 9,
    g1_itv_num = 10,
    g1_pass_num =11,
    g1_emp_num =12, 
    g1_total_cost = 13,
    g1_close_yn = 14,
    g1_close_dt = 15,
    g1_description =16;

 
var g2_pk = 0,
    g2_recruit_nm =1,
    g2_organization =2,
    g2_employee =3,
    g2_position =4,
    g2_start_dt =5,
    g2_end_dt = 6,
    g2_cost_01 =7,    
    g2_cost_02 =8,
    g2_cost_03 =9,
    g2_cost_04 =10,
    g2_cost_05 =11,
    g2_cost_06 =12,    
    g2_cost_07 =13,
    g2_cost_08 =14,
    g2_cost_09 =15,
    g2_cost_10 =16,
    g2_cost_total =17,
    g2_close_yn =18,
    g2_close_dt =19,
    g2_description =20;

var g3_pk =0,
    g3_recruit_nm =1,
    g3_organization =2,
    g3_employee =3,
    g3_position =4,
    g3_start_dt =5,
    g3_end_dt = 6,
    g3_close_yn =7, 
    g3_close_dt =8;
    
function BodyInit()
{ 	
    grdMaster.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
   
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select 'Y','Yes' from dual union all select 'N','No' from dual ")%>";
       grdRecClose.SetComboFormat(g3_close_yn,t1);
    
    
    datCostDisplay.Call("SELECT");

   
    
}
//-------------------------------------------------------
function OnToggle()
{
        if(imgMaster.status == "expand")
        {
            imgMaster.status = "collapse";
			tblDetail.style.display="none";
			tblDetail.style.height="0%";
			tblMaster.style.height="100%";
            imgMaster.src = "../../../../system/images/iconmaximize.gif";
			imgMaster.alt="Show detail recruitment";
        }
        else
        {
            imgMaster.status = "expand";
            tblDetail.style.display="";
            tblDetail.style.height="30%";
            tblMaster.style.height="70%";
            imgMaster.src = "../../../../system/images/close_popup.gif";
			imgMaster.alt="Close detail recruitment";
			
        }
  
}
//----------------------------------------------------
function OnSearch(obj)
{
    if(obj=="1")
        datRecruit.Call("SELECT");
    else if(obj=="2")
        datRecruit_Cost.Call("SELECT");
    else if(obj == "3")
        datRecruit_Close.Call("SELECT");
}
//------------------------------------------------------------------------------------
function OnSave(obj)
{
    if(confirm("Do you want to save?\nBạn muốn save?"))
    {
        if(obj == "1")
            datRecruit_Cost.Call();
        else if(obj == "2")
            datRecruit_Close.Call();
    }
}
function OnDataReceive(obj)
{
       if (obj.id=="datRecruit")
       {
            if (imgMaster.status=="expand" && txtEmp_PK.text !="")
            {
                datRecruit_Detail.Call("SELECT");
            }
            idRecord.text = grdMaster.rows -1 +" record(s)";
       } 
	   else if (obj.id=="datCostDisplay")
       {
            var icol= g2_cost_01 ; 
            grdCost.SetGridText(0,icol,grdDisplay.GetGridData(1,0));
            grdCost.SetGridText(0,icol+1,grdDisplay.GetGridData(1,1));
            grdCost.SetGridText(0,icol+2,grdDisplay.GetGridData(1,2));
            grdCost.SetGridText(0,icol+3,grdDisplay.GetGridData(1,3));
            grdCost.SetGridText(0,icol+4,grdDisplay.GetGridData(1,4));
            grdCost.SetGridText(0,icol+5,grdDisplay.GetGridData(1,5));
            grdCost.SetGridText(0,icol+6,grdDisplay.GetGridData(1,6));
            grdCost.SetGridText(0,icol+7,grdDisplay.GetGridData(1,7));
            grdCost.SetGridText(0,icol+8,grdDisplay.GetGridData(1,8));
            grdCost.SetGridText(0,icol+9,grdDisplay.GetGridData(1,9));
            grdCost.GetGridControl().ColHidden(icol)=!(Number(grdDisplay.GetGridData(1,10)));
            grdCost.GetGridControl().ColHidden(icol+1)=!(Number(grdDisplay.GetGridData(1,11)));
            grdCost.GetGridControl().ColHidden(icol+2)=!(Number(grdDisplay.GetGridData(1,12)));
            grdCost.GetGridControl().ColHidden(icol+3)=!(Number(grdDisplay.GetGridData(1,13)));
            grdCost.GetGridControl().ColHidden(icol+4)=!(Number(grdDisplay.GetGridData(1,14)));
            grdCost.GetGridControl().ColHidden(icol+5)=!(Number(grdDisplay.GetGridData(1,15)));
            grdCost.GetGridControl().ColHidden(icol+6)=!(Number(grdDisplay.GetGridData(1,16)));
            grdCost.GetGridControl().ColHidden(icol+7)=!(Number(grdDisplay.GetGridData(1,17)));
            grdCost.GetGridControl().ColHidden(icol+8)=!(Number(grdDisplay.GetGridData(1,18)));
            grdCost.GetGridControl().ColHidden(icol+9)=!(Number(grdDisplay.GetGridData(1,19)));
    
        }
        else if (obj.id == "datRecruit_Cost")
        {
            idRecord2.text = grdCost.rows -1 +" record(s)";
            grdCost.SetCellBgColor(1,g2_cost_01 ,grdCost.rows -1 ,g2_cost_10,0xFFEEFF);
        }
        else if (obj.id == "datRecruit_Close")
        {
            idRecord3.text = grdRecClose.rows -1 +" record(s)";
            grdRecClose.SetCellBgColor(1, g3_close_yn ,grdRecClose.rows -1 , g3_close_yn ,0xFFEEFF);
        }
}       
//-------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-------------------------------------------
function OnShowPopup(obj1)
{
    var strcom;
        var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			obj1.value = obj;
            
        }
}
//------------------------------------------
function OnShowDetail()
{
    if (imgMaster.status=="expand")
    {
        var irow=grdMaster.row;
        if (irow>=1)
        {
            txtEmp_PK.text=grdMaster.GetGridData(irow,g1_pk);
            datRecruit_Detail.Call("SELECT");
        }
        else
        {
            datRecruit_Detail.ClearData();
        }
    }
}
//-----------------------------
function On_Click()
{ 
	dt_tmp=grdCost.GetGridData(event.row,event.col)//luu tru gia tri vua click  
}
function On_AfterEdit()
{
   if(event.col == g2_cost_01||event.col== g2_cost_02||event.col== g2_cost_03||event.col == g2_cost_04||event.col==g2_cost_05 ||event.col == g2_cost_06||event.col== g2_cost_07||event.col== g2_cost_08||event.col == g2_cost_09||event.col==g2_cost_10)
 
        if(grdCost.GetGridData(event.row,g2_close_yn)=="Yes" && grdCost.GetGridData(event.row,event.col) != dt_tmp )
	      {
	        alert("Recruitment is closed, you can't change data!\nĐợt tuyển dụng đã đóng, bạn không thể thay đổi dữ liệu!") ;
	          grdCost.SetGridText(event.row,event.col,dt_tmp)
	          return;
	      }
	    else
        {
            if (isNaN(grdCost.GetGridData(event.row, event.col)))
            {
                alert("Please input number!\nBạn phải nhập số!");
                grdCost.SetGridText(event.row,event.col,dt_tmp)
                return;   
            }   
            if (Number(grdCost.GetGridData(event.row, event.col))<0)
            {
                alert("Please input number larger than 0!\nBạn phải nhập số lớn hơn 0!");
                grdCost.SetGridText(event.row,event.col,dt_tmp)
                return;   
            }  
        }
   
}


</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >

<!----------------------------------->
<gw:data id="datRecruit" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid"  function="ST_HR_SEL_HRRE00500_0" > 
            <input> 
                <input bind="lstOrg1" />
                <input bind="lstClose1" /> 
                <input bind="txtApp1" /> 
                <input bind="dtStartFrom1" />
                <input bind="dtStartTo1" /> 
                <input bind="dtEndFrom1" />
                <input bind="dtEndTo1" /> 
            </input> 
            <output bind="grdMaster" /> 
        </dso> 
   </xml> 
</gw:data> 
<!----------------------------------->
<gw:data id="datRecruit_Cost" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,7,8,9,10,11,12,13,14,15,16" function="ST_HR_SEL_HRRE00500_1" procedure="ST_HR_UPD_HRRE00500_1" > 
            <input> 
                <input bind="lstOrg2" />
                <input bind="lstClose2" /> 
                <input bind="lstRequest" />
                <input bind="lstPosition" />
                <input bind="dtStartFrom2" />
                <input bind="dtStartTo2" /> 
                <input bind="dtEndFrom2" />
                <input bind="dtEndTo2" /> 
            </input> 
            <output bind="grdCost" /> 
        </dso> 
   </xml> 
</gw:data> 
<!----------------------------------->
<gw:data id="datRecruit_Close" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,7" function="ST_HR_SEL_HRRE00500_2" procedure="ST_HR_UPD_HRRE00500_2" > 
            <input> 
                <input bind="lstOrg3" />
                <input bind="lstClose3" /> 
                <input bind="lstRequest2" />
                <input bind="lstPosition2" />
                <input bind="dtStartFrom3" />
                <input bind="dtStartTo3" /> 
                <input bind="dtEndFrom3" />
                <input bind="dtEndTo3" /> 
            </input> 
            <output bind="grdRecClose" /> 
        </dso> 
   </xml> 
</gw:data> 
<!----------------------------------->
<gw:data id="datRecruit_Detail" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid"  function="ST_HR_SEL_HRRE00500_3" > 
            <input> 
                <input bind="txtEmp_PK" />
            </input> 
            <output bind="grdDetail" /> 
        </dso> 
   </xml> 
</gw:data> 
<!------------------------------------------------------>
<gw:data id="datCostDisplay" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HRRE00500_4" > 
                <input bind="grdDisplay" >
                </input>
                <output  bind="grdDisplay" />
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:tab id="tabMain" border=1 style="width:100%;height:100%;" onpageactivate=""  >

    <table  name="Summary" id="tblEvent" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
		     <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:100%;width:100%" >
							<tr width="100%">
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
							</tr>
					        <tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right"><a title="Click here to show Organization" onclick="OnShowPopup(lstOrg1)" href="#tips" >Organization</a></td>
						        <td colspan="10"><gw:list id="lstOrg1" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        
						        
						       <td colspan="5" align=right style="white-space:nowrap"> Start DT &nbsp;</td>
						         <td colspan="4" style="white-space:nowrap"> 
							        <gw:datebox id="dtStartFrom1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="2" align=center> ~</td>
							    <td colspan=4> <gw:datebox id="dtStartTo1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						        <td colspan=5 style="white-space:nowrap" align=right> End DT &nbsp;</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndFrom1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=2 style="white-space:nowrap" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndTo1"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        
						       
						        <td colspan="1">
						        </td>
						        
						        <td colspan="1" align="left">
							        <gw:imgBtn id="ibtnSearch1" alt="Search" img="Search" text="Search" onclick="OnSearch(1)" />
						        </td>
						        <td  align="right">
						        
						        <td  align="right">
						        
						        </td>
						        <td  align="right">
						        <gw:imgBtn id="ibtnReport1"  alt="Report"  img="excel"  text="Exel"  onclick="OnReport(1)" />
						        </td>
					        </tr>
							<tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right"><font color="black"><b>Application No. &nbsp;</b>
						        </td>
						        <td colspan="10"> 
							        <gw:textbox id="txtApp1" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						        <td colspan="5" align="right" > 
						            Close YN &nbsp;
                                </td>
						        <td colspan="5">
						            <gw:list  id="lstClose1" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data>|ALL|Select All|Y|Yes|N|No
                                             </data></gw:list>    
						        </td>
						        <td colspan="11" align="right"><font color="black"></td>
						        <td colspan="12" align="right"><font color="black">
						            <gw:label id="idRecord" styles="width:100%;color:red;font-weight: bold" text="0 record(s)"></gw:label>
						        </td>
						        <td colspan="2" align="right">
        						    <img status="collapse" id="imgMaster" alt="Show detail recruitment" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle()"  />
        						</td>
					        </tr>
					        
					        
					        <tr align = top style="border:0;width:100%;height:90%" valign="center"> 
	                        <td  colspan="50"  align = top style="width:100%;height:100%" >
	                           <table width="100%" id="tblMaster" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                    <tr style="border:1;width:100%;height:100%" valign="top">
                                        <td>
	                                      <gw:grid   
		                                    id="grdMaster"  
		                                    header="_pk|Application No|Applicant|Approver|Oragnization|Employee(s)|Period|Start Date|End Date|App Num|ITV Num|Pass Num|Emp Num|Fee Total|_Close YN|_Date Close|Description"   
		                                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|-0|0|0|0"   
		                                    aligns="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|0"  
		                                    defaults="||||||||||||||||"  
		                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		                                    widths="0|2500|2500|2500|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
		                                    styles="width:100%; height:100%"   
		                                    sorting="T"   
		                                    acceptNullDate
		                                    oncellclick ="OnShowDetail()"
		                                    /> 
		                                  </td>  
                    	            </tr>
                    	         </table>   
                    	         <table width="100%" id="tblDetail" style="height:30%" border=1 cellpadding="0" cellspacing="0">
                                    <tr style="border:1;width:100%;height:100%" valign="top">
                                        <td>
	                                      <gw:grid   
		                                    id="grdDetail"  
		                                    header="_pk|Oraganization|Employee(s)|Position|Education|Experience|Language|App Num|ITV Num|Pass Num|Emp Num|Fee Total|Close YN|Date Close|Description"   
		                                    format="0|0|0|0|0|0|0|0|0|0|0|-0|0|0|0"   
		                                    aligns="0|0|1|1|1|1|1|1|1|1|1|1|1|1|0"  
		                                    defaults="||||||||||||||"  
		                                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
		                                    widths="0|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
		                                    styles="width:100%; height:100%"   
		                                    sorting="T"   
		                                    acceptNullDate
		                                    /> 
		                                  </td>  
                    	            </tr>
                    	         </table>   
  	                         </td>
                             </tr>
				            </table>
               </td>
        </tr>
    </table>   			 
    
    <table  name="Recruitment Cost" id="Table" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
		     <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:100%;width:100%" >
							<tr width="100%">
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
							</tr>
					        <tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right"><a title="Click here to show Organization" onclick="OnShowPopup(lstOrg2)" href="#tips" >Organization</a></td>
						        <td colspan="10"><gw:list id="lstOrg2" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        
						        
						       <td colspan="5" align=right style="white-space:nowrap"> Start DT &nbsp;</td>
						         <td colspan="4" style="white-space:nowrap"> 
							        <gw:datebox id="dtStartFrom2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="2" align=center> ~</td>
							    <td colspan=4> <gw:datebox id="dtStartTo2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						        <td colspan=5 style="white-space:nowrap" align=right> End DT &nbsp;</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndFrom2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=2 style="white-space:nowrap" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndTo2"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        
						       
						        <td colspan="1">
						        </td>
						        
						        <td colspan="1" align="left">
							        <gw:imgBtn id="ibtnSearch2" alt="Search" img="Search" text="Search" onclick="OnSearch(2)" />
						        </td>
						        <td  align="right">
							       <gw:imgBtn id="ibtnSave2" alt="Save" img="save" text="Save" onclick="OnSave(1)" />
						        
						        <td  align="right">
						        
						        </td>
						        <td  align="right">
						        <gw:imgBtn id="ibtnReport2"  alt="Report"  img="excel"  text="Exel"  onclick="OnReport(2)" />
						        </td>
					        </tr>
							<tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="7" align="right"><font color="black"><b>Recruitment Request &nbsp;</b>
						        </td>
						        <td colspan="8"> 
						            <gw:list id="lstRequest" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select pk,slip_no from thr_rec_request order by 2,1 ")%>|ALL|Select All
										</data>
								   </gw:list >  
						        </td>
						        <td colspan="5" align="right" > 
						            Close YN &nbsp;
                                </td>
						        <td colspan="5">
						            <gw:list  id="lstClose2" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data>|ALL|Select All|Y|Yes|N|No
                                             </data></gw:list>    
						        </td>
						        <td colspan="5" align="right"><font color="black"></td>
						        <td colspan="5" align="right"><font color="black"> Position &nbsp;</td>
						        <td colspan="5" align="right"><font color="black">
						            <gw:list  id="lstPosition" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                             </data></gw:list>
						        </td>
						        <td colspan="8" align="right"><font color="black">
						            <gw:label id="idRecord2" styles="width:100%;color:red;font-weight: bold" text="0 record(s)"></gw:label>
						        </td>
						        <td colspan="2" align="right">
        						    
        						</td>
					        </tr>
					        
					        
					        <tr align = top style="border:0;width:100%;height:90%" valign="center"> 
	                        <td  colspan="50"  align = top style="width:100%;height:100%" >
	                           <table width="100%" id="Table1" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                    <tr style="border:1;width:100%;height:100%" valign="top">
                                        <td>
	                                      <gw:grid   
		                                    id="grdCost"  
		                                    header="_pk|Recruitment Name|Oraganization|Employee(s)|Position|Start Date|End Date|Cost 01|Cost 02|Cost 03|Cost 04|Cost 05|Cost 06|Cost 07|Cost 08|Cost 09|Cost 10|Cost Total|Close YN|Date Close|Description"   
		                                    format="0|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0"   
		                                    aligns="0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0"  
		                                    defaults="||||||||||||||||||||"  
		                                    editcol="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|0|0|0|0"  
		                                    widths="0|2000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
		                                    styles="width:100%; height:100%"   
		                                    sorting="T" 
		                                    onentercell = "On_Click()"
		                                    onafteredit= "On_AfterEdit()"
		                                    /> 
		                                  </td>  
                    	            </tr>
                    	         </table>   
                    	         
  	                         </td>
                          </tr>
				     </table>
               </td>
        </tr>
    </table>   			 

    <table  name="Recruitment Status" id="Table4" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;" valign="top">
        <tr style="width:100%;height:100%" valign="top">
            <td>
		     <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:100%;width:100%" >
							<tr width="100%">
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
								<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
							</tr>
					        <tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="5" align="right"><a title="Click here to show Organization" onclick="OnShowPopup(lstOrg3)" href="#tips" >Organization</a></td>
						        <td colspan="10"><gw:list id="lstOrg3" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where del_if=0 ORDER BY NVL(A.SEQ,9999)")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        
						        
						       <td colspan="5" align=right style="white-space:nowrap"> Start DT &nbsp;</td>
						         <td colspan="4" style="white-space:nowrap"> 
							        <gw:datebox id="dtStartFrom3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
							       <td colspan="2" align=center> ~</td>
							    <td colspan=4> <gw:datebox id="dtStartTo3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" />
						        </td>
						        <td colspan=5 style="white-space:nowrap" align=right> End DT &nbsp;</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndFrom3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        <td colspan=2 style="white-space:nowrap" align=center>~</td>
						        <td colspan=4 style="white-space:nowrap" align=right><gw:datebox id="dtEndTo3"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="" /></td>
						        
						       
						        <td colspan="1">
						        </td>
						        
						        <td colspan="1" align="left">
							        <gw:imgBtn id="ibtnSearch3" alt="Search" img="Search" text="Search" onclick="OnSearch(3)" />
						        </td>
						        <td  align="right">
							       <gw:imgBtn id="ibtnSave3" alt="Save" img="save" text="Save" onclick="OnSave(2)" />
						        
						        <td  align="right">
						        
						        </td>
						        <td  align="right">
						        <gw:imgBtn id="ibtnReport3"  alt="Report"  img="excel"  text="Exel"  onclick="OnReport(3)" />
						        </td>
					        </tr>
							<tr style="border:0;width:100%;height:5%" valign="center">   
						        <td colspan="7" align="right"><font color="black"><b>Recruitment Request &nbsp;</b>
						        </td>
						        <td colspan="8"> 
						            <gw:list id="lstRequest2" styles="color:black;width:100%" value="ALL" > 
									   <data>
											<%=CtlLib.SetListDataSQL("select pk,slip_no from thr_rec_request order by 2,1 ")%>|ALL|Select All
										</data>
								   </gw:list >  
						        </td>
						        <td colspan="5" align="right" > 
						            Close YN &nbsp;
                                </td>
						        <td colspan="5">
						            <gw:list  id="lstClose3" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data>|ALL|Select All|Y|Yes|N|No
                                             </data></gw:list>    
						        </td>
						        <td colspan="5" align="right"><font color="black"></td>
						        <td colspan="5" align="right"><font color="black"> Position &nbsp;</td>
						        <td colspan="5" align="right"><font color="black">
						            <gw:list  id="lstPosition2" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>|ALL|Select All
                                             </data></gw:list>
						        </td>
						        <td colspan="8" align="right"><font color="black">
						            <gw:label id="idRecord3" styles="width:100%;color:red;font-weight: bold" text="0 record(s)"></gw:label>
						        </td>
						        <td colspan="2" align="right">
        						    
        						</td>
					        </tr>
					        
					        
					        <tr align = top style="border:0;width:100%;height:90%" valign="center"> 
	                        <td  colspan="50"  align = top style="width:100%;height:100%" >
	                           <table width="100%" id="Table3" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                    <tr style="border:1;width:100%;height:100%" valign="top">
                                        <td>
	                                      <gw:grid   
		                                    id="grdRecClose"  
		                                    header="_pk|Recruitment Name|Oraganization|Employee(s)|Position|Start Date|End Date|Close YN|Date Close"   
		                                    format="0|0|0|0|0|0|0|0|0"   
		                                    aligns="0|0|0|1|1|1|1|1|1"  
		                                    defaults="||||||||"  
		                                    editcol="0|0|0|0|0|0|0|1|0"  
		                                    widths="0|2500|3000|2000|2000|2000|2000|2000|2000"  
		                                    styles="width:100%; height:100%"   
		                                    sorting="T" 
		                                    /> 
		                                  </td>  
                    	            </tr>
                    	         </table>   
                    	         
  	                         </td>
                          </tr>
				     </table>
               </td>
        </tr>
    </table>   			 
    </gw:tab>	

    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    
    <gw:grid   
    id="grdDisplay"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Code Name 9|Code Name 10|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8|Display 9|Display 10"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0|0|0|0|0"  
    defaults="||||||||||||||||||"  
    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200"  
    styles="display:none" 
    sorting="T"    
/> 
</body>
</html>

				
