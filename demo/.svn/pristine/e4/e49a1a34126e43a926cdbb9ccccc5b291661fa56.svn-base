<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var binit=true;
var bgrp=false;
var v_language = "<%=Session("SESSION_LANG")%>";
var emp_pk_list;
var rpt_no=0;
var stt=0;
var ctl;
function BodyInit()
{
    //grdDetail.GetGridControl().FrozenCols =4;
    //grdDetail.GetGridControl().ScrollTrack=true;
     //if (v_language!="ENG")
        System.Translate(document);	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    CreateGrid();
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
}

//-------------------------------
function OnSearch(datobj)
{
    datobj.Call("SELECT");
}
//-------------------------------
function OnDataReceive(obj)
{
    if (obj.id=="datPayrollDetail")
   {
        
        lblRecord_1.text=grdDetail.rows-1 ;
        auto_resize_column(grdDetail,0,grdDetail.cols-1,9);
        grdDetail.GetGridControl().FrozenCols =5;
        grdDetail.GetGridControl().ScrollTrack=true;
        bgrp=false;
   }
   
}
//-------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//--------------------------------
function OnPrint(obj)
{
    rpt_no=obj;
    switch(rpt_no)
    {
         case 1:
         {
    /*   <input bind="lst_Org_1" /> 
                    <input bind="lstWG_1" /> 
                    <input bind="lstStatus_1" /> 
                    <input bind="txtEmpID_1" /> 
                    <input bind="lstMoney_Type_1" /> 
                    <input bind="lstPay_Type_1" /> 
                    <input bind="lstType_1" /> 
                    <input bind="dtFrom_Month_1" />
                    <input bind="dtTo_Month_1" />/**/
            var url=System.RootURL + "/reports/hd/ah/rpt_employee_payroll_detail.aspx?";
            url+='p_dept='+lst_Org_1.value;
            url+='&p_grp='+lstWG_1.value;
            url+='&p_status='+lstStatus_1.value;
            url+='&p_emp_id='+txtEmpID_1.text;
            url+='&p_money_type='+lstMoney_Type_1.value;
            url+='&p_pay_type='+lstPay_Type_1.value;
            url+='&p_type='+lstType_1.value;
            url+='&p_from='+dtFrom_Month_1.value;
            url+='&p_to='+dtTo_Month_1.value;
            window.open(url);
            break;
         } 
         case 2:
         {
            var url=System.RootURL + "/reports/hd/ah/rpt_employee_payroll_summary.aspx?";
            url+='p_dept='+lst_Org_2.value;
            url+='&p_grp='+lstWG_2.value;
            url+='&p_status='+lstStatus_2.value;
            url+='&p_emp_id='+txtEmpID_2.text;
            url+='&p_money_type='+lstMoney_Type_2.value;
            url+='&p_pay_type='+lstPay_Type_2.value;
            url+='&p_type='+lstType_2.value;
            url+='&p_from='+dtFrom_Month_2.value;
            url+='&p_to='+dtTo_Month_2.value;
            window.open(url);
            break;
         }  /**/       
        
    }
    
    
}
//------------------------------------
function OnChangeDept(objDept)
{
    txtDept.text=objDept.value ;
    //datGroupData.Call();
}
//------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:no;unadorned:yes;help:no');
    if (obj!=null)
    {
        lst_Org_1.value=obj
        
    }
    
}
//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    var obj;
    obj_list.SetDataText(value)    ;
    obj=obj_list.GetControl();
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}

//-----------------------------------------------
function GroupGrid(objid)
{
    var obj_grd;
    var i_col_num;
    i_col_num=0;
    obj_grd=grdDetail.GetGridControl();
    for (var i=0;i<obj_grd.cols & i_col_num==0 ;i++)
    {
        if (obj_grd.ColDataType(i)!=8)
            i_col_num=i;
        
    }
    if (objid==1)
    {
        obj_grd.OutlineBar =2 ;
        for (var j=i_col_num;j<obj_grd.cols;j++)
        {
            obj_grd.SubTotal(2,0, j,'',0x99FFFF,0x000000,'1','Total %s','',true);
            //obj_grd.SubTotal(2,1, j,'',0xccffff,0x000000,'1','Total','',true);
            obj_grd.SubTotal(2,1, j,'',0xccffff,0x000000,'1','Total %s','',true);
            for (var i=1;i<obj_grd.rows;i++)
            {
                if (obj_grd.IsCollapsed(i)==0)
                    obj_grd.IsCollapsed(i)=1;
            }
        }
        
    }
    else
    {
        //grdDetail.GetGridControl().OutlineBar =2 ;
        for (var i=1;i<obj_grd.rows;i++)
        {
            if (obj_grd.IsCollapsed(i)==2)
                obj_grd.IsCollapsed(i)=0;
        }
        //obj_grd.SubTotal(1);
        //grdDetail.GetGridControl().SubTotal(1,0, i,'',0x99FFFF,0x000000,'1','Total %s','',true);
       
    }
    auto_resize_column(grdDetail,0,grdDetail.cols-1,9);
}

function CreateGrid()
{
    var sHeader,sFormat,sAlign;
    sHeader="";
    sHeader="<%=CtlLib.SetListDataSQL("select '',initcap(a.code_nm) from vhr_hr_code a where a.id='HR0173' ORDER BY nvl(A.num_1,0)")%>";
    sHeader=sHeader.replace(/\x7C\x7C/g,"|");
    sHeader=sHeader.replace("DATA","Month");
    
    sFormat="<%=CtlLib.SetListDataSQL("select '',nvl(a.char_1,'0') from vhr_hr_code a where a.id='HR0173' ORDER BY nvl(A.num_1,0)")%>";
    sFormat=sFormat.replace(/\x7C\x7C/g,"|");
    sFormat=sFormat.replace("DATA","0");
    
    sAlign="<%=CtlLib.SetListDataSQL("select '',nvl(a.char_2,'0') from vhr_hr_code a where a.id='HR0173' ORDER BY nvl(A.num_1,0)")%>";
    sAlign=sAlign.replace(/\x7C\x7C/g,"|");
    sAlign=sAlign.replace("DATA","0");
    
   grdDetail.setHeader(sHeader);
   grdDetail.setFormat(sFormat);
   grdDetail.setAlign(sAlign);
   grdDetail.SetCellBold(0,1,0,grdDetail.cols-1,true);
   auto_resize_column(grdDetail,0,grdDetail.cols-1,9);
}
//-----------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
</script>

<body style=" margin-bottom:0; margin-top:0; margin-right:0" >
<!-------------------data control----------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lst_Org_1" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_FIND_REPORT_2" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------->
<gw:data id="datPayrollDetail" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="ST_HR_SEL_HRMR00800_0" > 
                <input bind="grdDetail">
                    <input bind="lst_Org_1" /> 
                    <input bind="lstWG_1" /> 
                    <input bind="lstStatus_1" /> 
                    <input bind="txtEmpID_1" /> 
                    <input bind="lstMoney_Type_1" /> 
                    <input bind="lstPay_Type_1" /> 
                    <input bind="lstType_1" /> 
                    <input bind="dtFrom_Month_1" />
                    <input bind="dtTo_Month_1" />
                </input> 
                <output bind="grdDetail"/>
            </dso> 
        </xml> 
</gw:data>
<!-------
<gw:data id="datPayrollSum" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid"  function="hr.sp_sel_payroll_sum" > 
                <input bind="grdEmployee_Sum">
                    <input bind="lst_Org_2" /> 
                    <input bind="lstWG_2" /> 
                    <input bind="lstStatus_2" /> 
                    <input bind="txtEmpID_2" /> 
                    <input bind="lstMoney_Type_2" /> 
                    <input bind="lstPay_Type_2" /> 
                    <input bind="lstType_2" /> 
                    <input bind="dtFrom_Month_2" />
                    <input bind="dtTo_Month_2" />
                </input> 
                <output bind="grdEmployee_Sum"/>
            </dso> 
        </xml> 
</gw:data>
--->
    <!--------------------main table----------------------------------->

    <table name="Detail" id="management" width="100%" cellpadding="0"  cellspacing="0" border=1 style="height:100%">
        <tr  style="width:100%;height:100%" valign="top">
            <td  style="width:100%;height:100%">
                <table width="100%" id="tblexp" style="height:10%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff" style="text-decoration: none; color=#0000ff" >
                            Organization </a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lst_Org_1" value='ALL' maxlen = "100" styles='width:100%'onchange="" >
								<data>
									<%= CtlLib.SetListDataSQL("SELECT A.PK,A.ORG_NM FROM TCO_ORG A WHERE A.DEL_IF=0 CONNECT BY PRIOR  A.PK=A.P_PK START WITH NVL(A.P_PK,0)=0")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Group
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstWG_1" value='ALL' maxlen = "100" styles='width:100%' >
								<data>
									<%=CtlLib.SetListDataSQL("select pk, workgroup_nm from thr_work_group where del_if=0") %>|ALL|Select All
								</data>
                            </gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="txtEmpID_1" styles='width:100%'  onenterkey="OnSearch(datPayrollDetail)"/>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:label id="lblRecord_1"  text="" maxlen = "100" styles="color:red;width:100%;font-weight: bold;font-size:12" />
                        </td>
			            <td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="search" id="ibtnSearch_1"    alt="Search"  onclick="OnSearch(datPayrollDetail)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button id="ibtnGroup_1" img="process" text="Group" onclick="GroupGrid(1)" />
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button id="ibtnGroup_2" img="process" text="Expand" onclick="GroupGrid(2)" />
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Status
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstStatus_1" value='ALL' maxlen = "100" styles='width:100%' >
                            <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0022' ORDER BY A.seq")%>|ALL|Select All</data></gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Money Type
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstMoney_Type_1" value='ALL' maxlen = "100" styles='width:100%' >
								<data>
									<%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0040' ORDER BY A.seq")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Pay Type
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:list  id="lstPay_Type_1" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All</data>
							</gw:list>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Type
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            <gw:list  id="lstType_1" value='>=0' maxlen = "100" styles='width:100%' >
                            <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data></gw:list>
			            </td>
                    </tr>
				  	<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Month
                        </td>
                        <td colspan=7 width="7%" style="border:0"  align="left" >
                            <gw:datebox id="dtFrom_Month_1" type="month" styles='width:100%'   lang="<%=Session("Lang")%>"/>
                        </td>
						<td colspan=8 width="8%" style="border:0"  align="left" >
                            <gw:datebox id="dtTo_Month_1" type="month" styles='width:100%'   lang="<%=Session("Lang")%>"/>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=15 width="15%" style="border:0" align="left"> 
				            
			            </td>
                    </tr>  	 
			     </table>
                 <table cellspacing=0 cellpadding=0 style="height:90%" width=100% border=1>
                    <tr style="border:1;width:100%;height:100%" valign="top">
                        <td  style="width:100%;height:100%;"> 
                          <gw:grid id='grdDetail'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
   

 
</body>
 
<gw:textbox id="txtReport_tmp" styles="display:none" text="1"/>
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>  
                          
</html>
