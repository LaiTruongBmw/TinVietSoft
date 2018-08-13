<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{ 	
    System.Translate(document); 
    
    var _Company_pk = "<%=Request.querystring("company_pk")%>";
    txtCompany_Pk.text = _Company_pk;
    grdEmployee.GetGridControl().ScrollTrack=true;
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}

}
function OnSearch()
{
    
//                alert(lstOrg.value);
//                alert(lstWG.value);
//                alert(chkTemp.value);
//                alert(txtTemp.text);
//                alert(lstNation.value);
//                alert(txtCompany_Pk.text);
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
        obj[0]=grdEmployee.GetGridData(irow,1); //pk
        obj[1]=grdEmployee.GetGridData(irow,4); //emp id
        obj[2]=grdEmployee.GetGridData(irow,6); //full name
        obj[3]=grdEmployee.GetGridData(irow,9); //join date
        obj[4]=grdEmployee.GetGridData(irow,2); //deparment
        obj[5]=grdEmployee.GetGridData(irow,10); //social no
        obj[6]=grdEmployee.GetGridData(irow,3); //group_nm
        obj[7]=grdEmployee.GetGridData(irow,11); //Tel
        obj[8]=grdEmployee.GetGridData(irow,12); //Name_VN
        obj[9]=grdEmployee.GetGridData(irow,13); //Dept_VN
        obj[10]=grdEmployee.GetGridData(irow,14); //Pos_E
        obj[11]=grdEmployee.GetGridData(irow,15); //Pos_VN
        obj[12]=grdEmployee.GetGridData(irow,16); //Pos_Code
        obj[13]=grdEmployee.GetGridData(irow,17); //Dept_pk
        obj[14]=grdEmployee.GetGridData(irow,18); //Group_pk
        obj[15]=grdEmployee.GetGridData(irow,19); //Manager_pk
        obj[16]=grdEmployee.GetGridData(irow,20); //Manager ID
        obj[17]=grdEmployee.GetGridData(irow,21); //Manager Name
        obj[18]=grdEmployee.GetGridData(irow,22); //Education
        obj[19]=grdEmployee.GetGridData(irow,23); //Married_YN
        obj[20]=grdEmployee.GetGridData(irow,24); //PerID
        obj[21]=grdEmployee.GetGridData(irow,25); //PerID
        obj[22]=grdEmployee.GetGridData(irow,26); //Manager kind
        obj[23]=grdEmployee.GetGridData(irow,27); //Manager kind name
        obj[29]=grdEmployee.GetGridData(irow,28); //Manager kind name
        obj[24]=grdEmployee.GetGridData(irow,29); //Company
        obj[25]=grdEmployee.GetGridData(irow,30); //Birthday
        obj[26]=grdEmployee.GetGridData(irow,31); //Sex Kind
        obj[27]=grdEmployee.GetGridData(irow,32); //Phone
        obj[28]=grdEmployee.GetGridData(irow,33); //FName
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
            dso_get_org_pk.Call();
       } 
       else if (obj.id=="dso_get_org_pk")
       {
            lstOrg.SetDataText(txtTCO_ORG_PK.text);
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

function OnCheck()
{
    for(i=1;i<grdEmployee.rows;i++)
    {
        if(grdEmployee.GetGridData(i,0)== "-1")
        {
            grdEmployee.SetGridText(i,0,0);
            btnCheck.text = "Chk All";
        }
        else
        {
            grdEmployee.SetGridText(i,0,-1);
            btnCheck.text = "Un Chk";
        }
    }
}

function OnSelectAll()
{
	var aValue = new Array();
	for(i=1;i<grdEmployee.rows;i++)
    {
		if(grdEmployee.GetGridData(i,0)== "-1")
		{
			var tmp= new Array();
			for(j=0;j<grdEmployee.cols;j++)
            {
				tmp[tmp.length] = grdEmployee.GetGridData(i,j);
			}
			aValue[aValue.length]=tmp;
		}
    }
	window.returnValue = aValue; 
	window.close(); 
}

function OnDbl()
{
	var aValue = new Array();
	var ctrl = grdEmployee.GetGridControl();
	tmp= new Array();
	for(j=0;j<grdEmployee.cols;j++)
	{
		tmp[tmp.length] = grdEmployee.GetGridData(ctrl.row,j);
	}
	aValue[aValue.length]=tmp; 

	window.returnValue = aValue;
	window.close(); 
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ac_sel_60010060_list_org"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="txtCompany_Pk" />
                    
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
        <dso  type="grid" function="ac_sel_60010060_popup"> 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstWG" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
				<input bind="lstNation" /> 
                <input bind="txtCompany_Pk" /> 
            </input> 
            <output bind="grdEmployee" /> 
        </dso> 
   </xml> 
</gw:data> 
<!--
<gw:data id="dso_get_org_pk" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="SP_pro_get_tco_org_pk" > 
                <input>
                    <input bind="txtCompany_Pk" /> 
                    <input bind="iduser_pk" /> 
                    
                </input> 
                <output>
                    <output bind="txtTCO_ORG_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>
-->
<gw:data id="dso_get_org_pk" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60010060_get_tco_org_pk" > 
                <input>
                    <input bind="txtCompany_Pk" /> 
                    <input bind="iduser_pk" /> 
                    
                </input> 
                <output>
                    <output bind="txtTCO_ORG_PK" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<table cellspacing="0" cellpadding="0" style="width:100%;height:100%" >
	<tr> 
	    <td >
            <fieldset style="padding:0">
		        <table style="width:100%">
					        <tr>   
						        <td width="12%" align="right"><b >Organization &nbsp;</td>
						        <td width="30%"><gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange="OnChangeDept()"> 
									 <data><%= CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 and a.org_type='06' order by a.seq")%>|ALL|Select All</data>
								   </gw:list > 
						        </td>
						        <td width="13%" align="right">Work-Group &nbsp;</td>
						        <td width="35%"><gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' >
                                    <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data></gw:list>
                                </td>
						        <td width="5%"></td>
						        <td align="left"><gw:imgBtn id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" /></td>
						        <td align="right"><gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" /></td>
					        </tr>
							<tr>   
						        <td align="right">Nation &nbsp;</td>
						        <td ><gw:list id="lstNation" styles="color:black;width:100%" value="01" onchange=""> 
									   <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...</data>
								   </gw:list > 
						        </td>
						        <td align="right">Search by &nbsp;</td>
						        <td >
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="30%"><gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|3|Card ID|4|Per ID</data> 
							                </gw:list></td>
                                            <td width="70%"><gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/></td>
                                        </tr>
                                    </table>
						        </td>
                                <td width=""></td>
                                <td ><gw:icon id="btnCheck" img="in" text="Chk All" onclick="OnCheck()"/></td>
                                <td colspan="" align=""><gw:imgBtn id="ibtnSearch" alt="Select" img="select" text="select" onclick="OnSelectAll()" /></td>
					        </tr>
					        <tr>   
						        <td colspan="7" align="left" style="color=#FF00CC; font-size:14">Double click on row to select</td>
                                
					        </tr>
		        </table>
            </fieldset>
	    </td> 
	</tr>		   
	<tr style="height:94%"> 
	    <td align = top style="width:100%;" >
  		    <gw:grid   
			    id="grdEmployee"  
			    header="|_PK|Organization|Work Group|Emp ID|Card ID|Full Name|OLD CODE|Personal ID|Join Date|_social_no|_Tel|_Name_VN|_Dept_VN|_Pos_nm|_Pos_Kname|_Pos_Type|_Dept_PK|_Group_PK|_Approver_PK|_Approver_ID|_Approver_Name|_Education|_Married_YN|_PersonID|_Address|_manager_kind|manager nm|Email|_COMPANY_PK|Birthday|Sex|Tel|Full_FName|Status"   
			    format="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    aligns="1|0|0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0"  
			    defaults="|||||||||||||||||||||||||||||||||||"  
			    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    widths="0|0|2000|1500|1000|1000|2500|0|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    styles="width:100%; height:100%"   
			    sorting="T"   
			    autosize="true"
			    oncelldblclick ="OnDbl()" /> 
    	
  	    </td>
    </tr>
</table>
<gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtTCO_ORG_PK" styles="display:none"/>
    <gw:textbox id="txtCompany_Pk" styles="display:none"/>
</body>
</html>

				
