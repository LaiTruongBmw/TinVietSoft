<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{ 	
    
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
    if (grdEmployee.rows>0) 
    {
        obj[0]=grdEmployee.GetGridData(irow,33); //pk
        obj[1]=grdEmployee.GetGridData(irow,2); //emp id
        obj[2]=grdEmployee.GetGridData(irow,4); //full name
        obj[3]=grdEmployee.GetGridData(irow,7); //join date
        obj[4]=grdEmployee.GetGridData(irow,0); //deparment
        obj[5]=grdEmployee.GetGridData(irow,15); //social no
        obj[6]=grdEmployee.GetGridData(irow,1); //group_nm
        obj[7]=grdEmployee.GetGridData(irow,16); //Tel
        obj[8]=grdEmployee.GetGridData(irow,17); //Name_VN
        obj[9]=grdEmployee.GetGridData(irow,18); //Dept_VN
        obj[10]=grdEmployee.GetGridData(irow,19); //Pos_E
        obj[11]=grdEmployee.GetGridData(irow,20); //Pos_VN
        obj[12]=grdEmployee.GetGridData(irow,21); //Pos_Code
        obj[13]=grdEmployee.GetGridData(irow,22); //Dept_pk
        obj[14]=grdEmployee.GetGridData(irow,23); //Group_pk
        obj[15]=grdEmployee.GetGridData(irow,24); //Manager_pk
        obj[16]=grdEmployee.GetGridData(irow,25); //Manager ID
        obj[17]=grdEmployee.GetGridData(irow,26); //Manager Name
        obj[18]=grdEmployee.GetGridData(irow,27); //Education
        obj[19]=grdEmployee.GetGridData(irow,28); //Married_YN
        obj[20]=grdEmployee.GetGridData(irow,29); //PerID
        obj[21]=grdEmployee.GetGridData(irow,30); //PerID
        obj[22]=grdEmployee.GetGridData(irow,31); //Manager kind
        obj[23]=grdEmployee.GetGridData(irow,8); //Manager kind name
        obj[29]=grdEmployee.GetGridData(irow,9); //Manager kind name
        obj[24]=grdEmployee.GetGridData(irow,32); //Company
        obj[25]=grdEmployee.GetGridData(irow,10); //Birthday
        obj[26]=grdEmployee.GetGridData(irow,11); //Sex Kind
        obj[27]=grdEmployee.GetGridData(irow,12); //Phone
        obj[28]=grdEmployee.GetGridData(irow,13); //FName
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
            <dso  type="list" procedure="ac_sel_60010060_user_role2"  > 
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
            <dso  type="list" procedure="ac_pro_60010060_dept_data_all" > 
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
            <dso  type="list" procedure="ac_PRO_60010060_TEAM_DATA_ALL" > 
                <input>
                    <input bind="lstOrg" /> 
                </input> 
                <output>
                    <output bind="lstWG" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datEmployeePopup"> 
    <xml> 
        <dso  type="grid" function="ac_sel_60010060_emp_popup2"> 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstWG" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
				<input bind="lstNation" /> 
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
						        <td colspan="15"><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange="OnChangeDept()"> 
									   <data>
											<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 and a.org_type='06' order by a.seq")%>|ALL|Select All
										</data>
								   </gw:list > 
						        </td>
						        <td colspan="7" align="right"><font color="black"><b>Work-Group &nbsp;</b>
						        </td>
						        <td colspan="15" > <gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' >
                                             <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data></gw:list>
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
											<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...
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
						        <td colspan="50" align="left" valign="middle"><font color="black"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
					        </tr>
				        </table>
			        </td>
		        </tr>
		    </table>
	    </td> 
	</tr>		   
	<tr align = top> 
	    <td align = top style="width:100%;height:93%" >
        <!--header="0._PK|1.Organization|2.Work Group|3.Emp ID|4.Card ID|5.Full Name|6.OLD CODE|7.Personal ID|8.Join Date|9._social_no|10._Tel|11._Name_VN|12._Dept_VN|13._Pos_nm|14._Pos_Kname|15._Pos_Type|16._Dept_PK|17._Group_PK|18._Approver_PK|19._Approver_ID|20._Approver_Name|21._Education|22._Married_YN|23._PersonID|24._Address|25._manager_kind|26.manager nm|27.Email|28._COMPANY_PK|29.Birthday|30.Sex|31.Tel|32.Full_FName|33.Status"   -->
  		<!--header="0.Organization|1.Work Group|2.Emp ID|3.Card ID|4.Full Name|5.OLD CODE|6.Personal ID|7.Join Date|8.Manager Name|9.Email|10.Birthday|11.Sex|12.Tel|13.Full_FName|14.Status|15._social_no|16._Tel|17._Name_VN|18._Dept_VN|19._Pos_nm|20._Pos_Kname|21._Pos_Type|22._Dept_PK|23._Group_PK|24._Approver_PK|25._Approver_ID|26._Approver_Name|27._Education|28._Married_YN|29._PersonID|30._Address|31._manager_kind|32._COMPANY_PK|33._PK"   -->
            <div style="width:100%; height:96%; overflow:auto;">
					<gw:datagrid   
			    id="grdEmployee"  
			    header="Organization|Work Group|Emp ID|Card ID|Full Name|OLD CODE|Personal ID|Join Date|Manager Name|Email|Birthday|Sex|Tel|Full_FName|Status|_social_no|_Tel|_Name_VN|_Dept_VN|_Pos_nm|_Pos_Kname|_Pos_Type|_Dept_PK|_Group_PK|_Approver_PK|_Approver_ID|_Approver_Name|_Education|_Married_YN|_PersonID|_Address|_manager_kind|_COMPANY_PK|_PK"   
			    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    aligns="0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0"  
			    defaults="|||||||||||||||||||||||||||||||||"  
			   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    widths="200|150|100|100|200|100|100|70|100|100|70|50|100|200|50|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    styles="width:100%; height:100%"   
			    sorting="T"   
			    autosize="true"
                paging="true" pageview="50"
			    oncelldblclick ="OnSelect()" /> 
    	    </div>
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

				
