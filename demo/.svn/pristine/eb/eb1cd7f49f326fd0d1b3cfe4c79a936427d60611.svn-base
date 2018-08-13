<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Get Employees</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
        System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    Set_DisEnable();
    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
              datUser_info.Call(); 
    
}
function Set_Enable()
{
    ibtnSelect.SetEnable(1);
    chkSelect.SetEnable(1);
    ibtnSelectAll.SetEnable(1);
}
function Set_DisEnable()
{
    ibtnSelect.SetEnable(0);
    chkSelect.SetEnable(0);
    ibtnSelectAll.SetEnable(0);
}
function OnDataReceive(obj)
{
    if (obj.id=="datUser_info")
       {
            //datGroupData.Call();
       }
       else if (obj.id=="datSalary_Adjust_popup")
       {
            if(idGrid.rows>1)
                Set_Enable();
            idRecord.text=idGrid.rows-1 ;
       }
       
}      
//----------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg.value=obj
        
    }
    
}
function OnChangeDept()
{
    //txtDept.text=lstOrg.value;
    //datGroupData.Call();
}
function OnSearch()
{
    datSalary_Adjust_popup.Call("SELECT");
}
function OnCheck()
{
    var tmp
    if(chkSelect.value=='F')
        tmp=0;
    else
        tmp=-1;
        
    var ctrl=idGrid.GetGridControl();
	if(ctrl.SelectedRows>0)
		for(var i=0;i<ctrl.SelectedRows;i++)
    		idGrid.SetGridText(ctrl.SelectedRow(i),0,tmp);
}
//--------------------------------------------------------------------------
function OnSelect()
{
    
   if(Adj_DT.value=="")
   {
     alert("Choose Adjust date please!\nBạn phải nhập ngày điều chỉnh!");
     return;
   }     
    var aData =new Array();
    var j;
    j=0;
    var bSelect=false;
    for (var i=1;i<idGrid.rows;i++)
    {
        if (idGrid.GetGridData(i,0)=='-1')
        {   
            var aRow=new Array();
            bSelect=true;
            aRow[0]=idGrid.GetGridData(i,1) //get grp nm
            aRow[1]=idGrid.GetGridData(i,2) //emp_id
            aRow[2]=idGrid.GetGridData(i,3) //get full name
            aRow[3]=Adj_DT.value //get adj_dt
            aRow[4]=idGrid.GetGridData(i,6) //get emp_pk
            aData[j]=aRow;
            j=j+1;
        }
        
    }
    if (bSelect==true)
    {
        var aRowSel=new Array();
        aRowSel[0]=lstOrg.value;//department
        aRowSel[1]=lstwg.value;//group
        aRowSel[3]=idtxtTmp.text;//
        aRowSel[4]=Adj_DT.value;//dt
        aData[j]=aRowSel;
    }
    window.returnValue = aData; 			
	this.close();
}
//---------------------------------------------------
function OnSelectAll()
{
   if(Adj_DT.value=="")
   {
     alert("Choose Adjust date please!\nBạn phải nhập ngày điều chỉnh!");
     return;
   }   
    var aData =new Array();
    var j;
    j=0;
    var bSelect=false;
    for (var i=1;i<idGrid.rows;i++)
    {
            var aRow=new Array();
            bSelect=true;
            aRow[0]=idGrid.GetGridData(i,1) //get grp nm
            aRow[1]=idGrid.GetGridData(i,2) //emp_id
            aRow[2]=idGrid.GetGridData(i,3) //get full name
            aRow[3]=Adj_DT.value //get adj_dt
            aRow[4]=idGrid.GetGridData(i,6) //get emp_pk
            aData[j]=aRow;
            j=j+1;
    }
    if (bSelect==true)
    {
        var aRowSel=new Array();
        aRowSel[0]=lstOrg.value;//department
        aRowSel[1]=lstwg.value;//group
        aRowSel[3]=idtxtTmp.text;//
        aRowSel[4]=Adj_DT.value;//dt
        aData[j]=aRowSel;
    }
    window.returnValue = aData; 			
	this.close();
}
//--------------------------------------------------
function OnExit()
{
    window.returnValue = Null; 			
	this.close();
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
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datSalary_Adjust_popup" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="2,3,4,5,6,7,8" function="ST_HR_SEL_HRPM00501_0"> 
                <input bind="idGrid" >
                    <input bind="lstOrg" />
                    <input bind="lstwg" />
                    <input bind="lstStatus" />
                    <input bind="Adj_DT" />
                    <input bind="idtxtTmp" />
                    <input bind="lstNation" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" align="top" border="1" >
	<tr>
	    <td>
	        <table style="width:100%;height:12%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	            <tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						<a class="eco_link" title="Click here to show department" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
					</td>
					<td colspan=15 width="15%" style="border:0"  align="left" >
						<gw:list  id="lstOrg" value="ALL"  maxlen = "100" styles='width:100%' onchange="" >
                            <data>
                                <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                            </data>
                        </gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Group
					</td>
					<td colspan=15 style="border:0" width="15%"  align="left" >
						<gw:list  id="lstwg" value="ALL" maxlen = "100" styles='width:100%' >
                        <data><%=CtlLib.SetListDataSQL("SELECT A.PK,A.WORKGROUP_NM FROM THR_WORK_GROUP A WHERE A.DEL_IF=0 ORDER BY A.WORKGROUP_ID ")%>|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Employee
					</td>
					<td colspan=15 width="15%" style="border:0"> 
						<gw:textbox id="idtxtTmp" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
					</td>
					<td colspan=5 width="5%" style="border:0"   >
						
					</td>
					<td colspan=5 width="5%" style="border:0"  align="left" >
						
					</td>
					<td colspan=5 width="5%" style="border:0" align="center"> 
						<gw:label id="idRecord" text="" styles="color:red;width:100%;font-weight: bold;font-size:12" ></gw:label>
					</td>
					<td colspan=5 width="5%" style="border:0" align="left"> 
						<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left"> 
						<gw:button img="close" text="Close" id="ibtnExit"   alt="Exit"  onclick="OnExit()"/>
					</td>
				</tr>
				<tr style="border:0;width:100%;height:4%" valign="center" >
					<td colspan=2 width="2%" style="border:0"  >
						<gw:checkbox id="chkSelect" value="F" onclick="OnCheck()" ></gw:checkbox >
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Adjust Date
					</td>
					<td colspan=15 width="15%" style="border:0"  align="left" >
						<gw:datebox id="Adj_DT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept />
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Status
					</td>
					<td colspan=15 style="border:0" width="15%"  align="left" >
						<gw:list  id="lstStatus" value="A" maxlen = "100" styles='width:100%' >
                                        <data><%=CtlLib.SetListDataSQL("SELECT CODE,CODE_NM FROM VHR_HR_CODE WHERE ID='HR0022'")%>|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
						Nation
					</td>
					<td colspan=15 width="15%" style="border:0"> 
						<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' >
                        <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' and code in('01','02') order by code" )%>|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"  >
					
					</td>
					<td colspan=8 width="8%" style="border:0"  align="left" >
					
					</td>
					<td colspan=5 width="5%" style="border:0" align="left"> 
						
					</td>
					<td colspan=5 width="5%" style="border:0" align="left"> 
						<gw:button img="select" id="ibtnSelect" text="Select"   alt="Select"  onclick="OnSelect()"/>
					</td>
					<td colspan=5 width="5%" style="border:0" align="left"> 
						<gw:button img="select" id="ibtnSelectAll" text="Select All"   alt="Select All"  onclick="OnSelectAll()"/>
					</td>
				</tr>
	        </table>
	        <table id="tblMain" style="width:100%;height:88%" border=1 cellpadding="0" cellspacing="0">
	            <tr style="width:100%;height:100%">
	                <td id="tdMaster" style="width:100%">
	                    <gw:grid   
				        id="idGrid"  
				        header="Select|Organization|Emp ID|Full Name|Join Date|Status|_emp_pk"   
				        format="3|0|0|0|0|0|0"  
				        aligns="0|0|0|0|0|0|0"  
				        defaults="||||||"  
				        editcol="1|0|0|0|0|0|0|0"  
				        widths="700|2000|1500|2500|1500|2000|1500|0"  
				        styles="width:100%; height:100% "   
				        sorting="T"   
				        oncellclick     = ""/>
	                </td>
	            </tr>
	        </table>
	    </td>
	</tr>
</table>

   <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
</body>
</html>

