<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%     
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1">
    <title>Get Employee List</title>
</head>

<script type="text/javascript">

var v_language = "<%=Session("SESSION_LANG")%>";
//============================================================================
function BodyInit()
{ 	
    grdEmployee.GetGridControl().ScrollTrack=true;
	
    if (v_language!="ENG")
        System.Translate(document);
    
	iduser_pk.text   = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    
	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}

}
//=============================================================================
function OnSearch()
{
    datEmployeePopup.Call("SELECT");
}
//=============================================================================
function OnSelect1()
{
  
    OnSelect(grdEmployee);
}
//=============================================================================
function OnExit()
{
	var arr_data = new Array();
	    		     
    var arrTemp=new Array();		
	    
	for(var j=0;j<grdEmployee.cols;j++)
    {
        arrTemp[j]= "";            
    }
         
    arr_data[arr_data.length]= arrTemp;	 
      
    if ( arr_data !=null )
    {
	    window.returnValue =  arr_data;
	    window.close();
    }
      
}

//===========================================================================================
function OnSelect(oGrid)
{
    var arr_data = new Array();
	
    for (i = 0; i<oGrid.GetGridControl().SelectedRows ; i++)
	{
		var row = oGrid.GetGridControl().SelectedRow(i);
      
        var arrTemp=new Array();		
	    
	     for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[j]= oGrid.GetGridData(row,j);            
         }
         
         arr_data[arr_data.length]= arrTemp;
	}
      
      if ( arr_data !=null )
      {
	    window.returnValue =  arr_data;
	    window.close();
      }
      else
      {
        alert("You have not selected data yet.");
      }
}
//=========================================================================================== 
 
</script>

<body>
    <!-- MainTable -->
    <gw:data id="datUser_info" onreceive=""> 
        <xml>
            <dso  type="list" procedure="st_lg_sel_fpab00760_1"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="datEmployeePopup"> 
    <xml> 
        <dso  type="grid" function="st_lg_sel_fpab00760_2"> 
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
    <table cellspacing="0" cellpadding="0" border="1" style="width: 100%; height: 100%;">
        <tr>
            <td align="top">
                <table align="top" width="100%" style="height: 7%">
                    <tr>
                        <td align="Left">
                            <table border="0" cellspacing="0" cellpadding="0" style="height: inherit">
                                <tr width="100%">
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                    <td width="2%">
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" align="right">
                                        <font color="black"><b>Organization </b>
                                    </td>
                                    <td colspan="15">
                                        <gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange=""> 
									   <data>
											<%=CtlLib.SetListDataSQL("select a.pk,a.org_nm from tco_org a where a.del_if=0 and a.org_type='06' order by a.seq")%>|ALL|Select All
										</data>
								   </gw:list>
                                    </td>
                                    <td colspan="7" align="right">
                                        <font color="black"><b>Work-Group </b>
                                    </td>
                                    <td colspan="15">
                                        <gw:list id="lstWG" value='ALL' maxlen="100" styles='width:100%'>
                                             <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_NM FROM Thr_work_Group WHERE DEL_IF = 0 order by workgroup_id" )%>|ALL|Select All</data></gw:list>
                                    </td>
                                    <td colspan="">
                                    </td>
                                    <td colspan="2" align="left">
                                        <gw:button id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" />
                                    </td>
                                    <td colspan="2">
                                        <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdEmployee)" />
                                    </td>
                                    <td colspan="2" align="right">
                                        <gw:button id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="7" align="right">
                                        <font color="black"><b>Nation </b>
                                    </td>
                                    <td colspan="10">
                                        <gw:list id="lstNation" styles="color:black;width:100%" value="01" onchange=""> 
									   <data>
											<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All ...
										</data>
								   </gw:list>
                                    </td>
                                    <td colspan="5">
                                    </td>
                                    <td colspan="7" align="right">
                                        <font color="black"><b>Search by </b>
                                    </td>
                                    <td colspan="5">
                                        <gw:list id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|3|Card ID|4|Per ID</data> 
							        </gw:list>
                                    </td>
                                    <td colspan="10">
                                        <gw:textbox id="txtTemp" onenterkey="OnSearch()" styles='width:100%' />
                                    </td>
                                    <td colspan="">
                                    </td>
                                </tr>
                                <%--<tr>   
						        <td colspan="50" align="left" valign="middle"><font color="black"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
					        </tr>--%>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr align="top">
            <td align="top" style="width: 100%; height: 93%">
                <gw:grid id="grdEmployee" header="_PK|Organization|Work Group|Emp ID|Card ID|Full Name|OLD CODE|Personal ID|Join Date|_social_no|_Tel|_Name_VN|_Dept_VN|_Pos_nm|_Pos_Kname|_Pos_Type|_Dept_PK|_Group_PK|_Approver_PK|_Approver_ID|_Approver_Name|_Education|_Married_YN|_PersonID|_Address|_manager_kind|manager nm|Email|_COMPANY_PK|Birthday|Sex|Tel|Full_FName"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0"
                    defaults="|||||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2000|1500|1000|1000|2500|0|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="T" autosize="true" oncelldblclick="OnSelect1()" />
            </td>
        </tr>
    </table>
    <gw:textbox id="iduser_pk" styles="display:none" />
    <gw:textbox id="txtHr_level" styles="display:none" />
    <gw:textbox id="txtDeptData" styles="display:none" />
    <gw:textbox id="txtUpperDept" styles="display:none" />
    <gw:textbox id="txtGroupData" styles="display:none" />
</body>
</html>
