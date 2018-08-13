<!-- #include file="../../../system/lib/form.inc"  -->
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{ 	
    grdEmployee.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}

}
function OnSearch()
{
    datEmployeePopup.Call("SELECT");
}
function OnSelect()
{
    OnExit();
}
function OnExit()
{
    var obj= Array();
    var irow;
    irow=grdEmployee.row;
    if (irow>0) 
    {
        obj[0]=grdEmployee.GetGridData(irow,0); //pk
        obj[1]=grdEmployee.GetGridData(irow,3); //emp id
        obj[2]=grdEmployee.GetGridData(irow,5); //full name
        obj[3]=grdEmployee.GetGridData(irow,8); //join date
        obj[4]=grdEmployee.GetGridData(irow,1); //deparment
        obj[5]=grdEmployee.GetGridData(irow,9); //social no
        obj[6]=grdEmployee.GetGridData(irow,2); //group_nm
        obj[7]=grdEmployee.GetGridData(irow,10); //Tel
        obj[8]=grdEmployee.GetGridData(irow,11); //Name_VN
        obj[9]=grdEmployee.GetGridData(irow,12); //Dept_VN
        obj[10]=grdEmployee.GetGridData(irow,13); //Pos_E
        obj[11]=grdEmployee.GetGridData(irow,14); //Pos_VN
        obj[12]=grdEmployee.GetGridData(irow,15); //Pos_Code
        obj[13]=grdEmployee.GetGridData(irow,16); //Dept_pk
        obj[14]=grdEmployee.GetGridData(irow,17); //Group_pk
        obj[15]=grdEmployee.GetGridData(irow,18); //Manager_pk
        obj[16]=grdEmployee.GetGridData(irow,19); //Manager ID
        obj[17]=grdEmployee.GetGridData(irow,20); //Manager Name
        obj[18]=grdEmployee.GetGridData(irow,21); //Education
        obj[19]=grdEmployee.GetGridData(irow,22); //Married_YN
        obj[20]=grdEmployee.GetGridData(irow,23); //PerID
        obj[21]=grdEmployee.GetGridData(irow,24); //PerID
        obj[22]=grdEmployee.GetGridData(irow,25); //Manager kind
        obj[23]=grdEmployee.GetGridData(irow,26); //Manager kind name
        obj[24]=grdEmployee.GetGridData(irow,27); //Company
        obj[25]=grdEmployee.GetGridData(irow,29); //Birthday
    }    
    else 
    {
        obj=null;
    }
	window.returnValue = obj; 
	window.close();
}
function EXITOnClick()
{
	OnExit();
}
//------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
       if (obj.id=="datUser_info")
       {
            datTeamData.Call();
       } 
        else if (obj.id=="datDeptData")
       {
            if(txtHr_level.text=="6")
                    txtDeptData.text=txtDeptData.text+"|ALL|Select All";
                lstOrg.SetDataText(txtDeptData.text)    ;
                
                  obj=lstOrg.GetControl()
		        if (obj.options.length ==2)
			        obj.options.selectedIndex=0;
		        else
			        obj.options.selectedIndex=obj.options.length-1;
            datTeamData.Call();
       }
       else if (obj.id=="datTeamData")
       {
            obj=lstWG.GetControl();
	        if (obj.options.length ==2)
		        obj.options.selectedIndex=0;
	        else
		        obj.options.selectedIndex=obj.options.length-1;
            
       }
       else if (obj.id=="datEmployeePopup")
       {lbRecord.text=grdEmployee.rows-1 + " record(s).";
       }
       
	   
}     
function OnChangeDept()
{
    //txtDept.text=lstDept_Code.value;
    datTeamData.Call();
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="pm_sel_61020020_user_role2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="pm_pro_61020020_dept_data_all" > 
                <input>
                    <input bind="txtUpperDept" /> 
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datTeamData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="pm_pro_61020020_team_data_all" > 
                <input>
                    <input bind="lstOrg" /> 
                </input> 
                <output>
                    <output bind="lstWG" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datEmployeePopup" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" function="pm_sel_61020020_employee_posli"> 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstWG" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
				<input bind="lstNation" /> 
				<input bind="iduser_pk" />
            </input> 
            <output bind="grdEmployee" /> 
        </dso> 
   </xml> 
</gw:data> 
<table style='margin-left:10px' align = top class="itable" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;" >
	<tr> 
	    <td  align = top >
		    <table align = top  width="100%" style="height:7%">
		        <tr>
			        <td align="Left">
				        <table   border="0" CELLSPACING="0" CELLPADDING="0" style="height:inherit" >
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
					        <tr>   
						        <td colspan="7" align="right"><font color="black"><b >Organization &nbsp;</b></td>
						        <td colspan="15"><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											<%=ESysLib.SetListDataSQL("select a.pk,a.org_nm from comm.tco_org a where a.del_if=0 and a.org_type='06' order by a.seq")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        <td colspan="7" align="right"><font color="black"><b>Work-Group &nbsp;</b>
						        </td>
						        <td colspan="15" > <gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=Esyslib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data></gw:list>
                                             </td>
						        <td colspan= "" ></td>
						        <td colspan="2" align="left">
							        <gw:imgBtn id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td colspan="2" ></td>
						        <td colspan="2" align="right">
							       <gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" />
						        </td>
					        </tr>
							<tr>   
						        <td colspan="7" align="right"><font color="black"><b >Nation &nbsp;</b></td>
						        <td colspan="10"><gw:list id="lstNation" styles="color:black;width:100%" value="01" onchange=""> 
									   <data>
											<%=ESysLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...
										</data>
								   </gw:list > 
						        </td>
								<td colspan="5"></td>
						        <td colspan="7" align="right"><font color="black"><b>Search by &nbsp;</b>
						        </td>
						        <td colspan="5">
							        <gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|3|Card ID|4|Per ID</data> 
							        </gw:list>
						        </td>
        						
						        <td colspan="10"> 
							        <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						        <td colspan="" ></td>
					        </tr>
					        <tr>   
						        <td colspan="25" align="left" valign="middle"><font color="black"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
						        <td colspan="25" align="right" valign="middle"><gw:label id="lbRecord" text="" styles="width:100%" ></gw:label>
					        </tr>
				        </table>
			        </td>
		        </tr>
		    </table>
	    </td> 
	</tr>		   
	<tr align = top> 
	    <td align = top style="width:100%;height:93%" >
  		    <gw:grid   
			    id="grdEmployee"  
			    header="_PK|Organization|Work Group|Emp ID|Card ID|Full Name|OLD CODE|Personal ID|Join Date|_social_no|_Tel|_Name_VN|_Dept_VN|_Pos_nm|_Pos_Kname|_Pos_Type|_Dept_PK|_Group_PK|_Approver_PK|_Approver_ID|_Approver_Name|_Education|_Married_YN|_PersonID|_Address|_manager_kind|manager nm|Email|_COMPANY_PK|Birthday"   
			    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    aligns="0|0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1"  
			    defaults="||||||||||||||||||||||||||||||"  
			    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    widths="0|2000|1500|1000|1000|2500|0|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    styles="width:100%; height:100%"   
			    sorting="T"   
			    autosize="true"
			    oncelldblclick ="OnSelect()" /> 
    	
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

				
