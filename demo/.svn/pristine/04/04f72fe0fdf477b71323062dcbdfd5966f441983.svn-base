<!-- #include file="../../../../system/lib/form.inc"  -->

 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var init_from;
function BodyInit()
{ 	
    System.Menu.LoadDictionaryForPopup(System.Menu.OnGetID(window.location.toString()));
	init_from = setInterval(function(){ if(System.Menu.init_lang == "Y")BodyProcess(); }, 1000);
}
function BodyProcess(){
	clearInterval(init_from);
	System.Translate_V2(document, System.Menu.GetMenuPS());
	grdEmployee.GetGridControl().ScrollTrack=true;
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
    var data;
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
    
	ChangeColorItem(lstOrg.GetControl());

	if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	{
        datUser_info.Call();     	    
	}
}

//-----------------------------------------------
function ChangeColorItem(lstctl) {
    var slevel1, slevel2, slevel3, slevel4;
    for (var i = 0; i < lstctl.options.length; i++) {
        slevel1 = lstctl.options.item(i).text.substr(0, 1);
        slevel2 = lstctl.options.item(i).text.substr(0, 3);
        slevel3 = lstctl.options.item(i).text.substr(0, 5);
        slevel4 = lstctl.options.item(i).text.substr(0, 7);
        if (slevel4 != ".......") {
            if (slevel3 == ".....") {
                lstctl.options.item(i).style.color = "0066CC";
            }
            else {
                if (slevel2 == "...") {
                    lstctl.options.item(i).style.color = "FF4500";
                }
                else {
                    if (slevel1 == ".")
                        lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                }
            }
        }
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
        obj[29]=grdEmployee.GetGridData(irow,27); //Manager kind name
        obj[24]=grdEmployee.GetGridData(irow,28); //Company
        obj[25]=grdEmployee.GetGridData(irow,29); //Birthday
        obj[26]=grdEmployee.GetGridData(irow,30); //Sex Kind
        obj[27]=grdEmployee.GetGridData(irow,31); //Phone
        obj[28]=grdEmployee.GetGridData(irow,32); //FName
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
 
</script>
<body bgcolor='#FFFFFF' style="overflow:hidden;" bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datUser_info" onreceive=""  > 
        <xml>
            <dso  type="list" procedure="hr_sp_sel_user_role2"  > 
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
        <dso  type="grid" function="ST_HR_SEL_HRCO00700_0"> 
            <input> 
                <input bind="lstOrg" /> 
                <input bind="lstWG" /> 
                <input bind="txtTemp" /> 
				<input bind="lstNation" /> 
            </input> 
            <output bind="grdEmployee" /> 
        </dso> 
   </xml> 
</gw:data> 
<table style='margin-left:0px' align = top class="" cellspacing=0 cellpadding=0 border="0" style="width:100%;height:100%;" >
	<tr> 
	    <td  align = top >
		    <table align = top  width="100%" style="height:7%">
		        <tr>
			        <td align="Left">
				        <table   border="0" CELLSPACING="3" CELLPADDING="2" style="height:inherit" >
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
						        <td colspan="7" align="right"><font color="black"><b >Employee </b></td>
						        <td colspan="22"><gw:textbox id="txtTemp" onenterkey ="OnSearch()" styles='width:100%'/></td>
						        <td colspan="15"></td>
        						
						        <td colspan="2">
							        <gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td colspan="2" ></td>
						        <td colspan="2">
							       <gw:button id="ibtnExit" alt="Exit" img="cancel" text="Exit" onclick="OnExit()" />
						        </td>
						        <% 
					                IF Session("CODEADMIN_YN").ToString() = "Y" AND Session("SESSION_LANG").ToString() = "ENG" THEN
				                %>
					                <td><gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" /></td>
				                <% END IF %>
					        </tr>
                            <tr>   
						        <td colspan="7" align="right"><font color="black"><b >Organization </b></td>
						        <td colspan="15">
                                    <gw:list id="lstOrg" styles="color:black;width:100%" value="ALL" onchange="" /> 
						        </td>
						        <td colspan="7" align="right"><font color="black"><b>Group </b></td>
						        <td colspan="10" > 
                                    <gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%' />
                                </td>
						        <td colspan="5" align="right"><font color="black"><b >Nation </b></td>
						        <td colspan="6">
                                    <gw:list id="lstNation" styles="color:black;width:100%" value="01" onchange="" /> 
						        </td>
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
  		    <gw:grid   
			    id="grdEmployee"  
			    header="_PK|Organization|Work Group|Emp ID|Card ID|Full Name|OLD CODE|Personal ID|Join Date|_social_no|_Tel|_Name_VN|_Dept_VN|_Pos_nm|_Pos_Kname|_Pos_Type|_Dept_PK|_Group_PK|_Approver_PK|_Approver_ID|_Approver_Name|_Education|_Married_YN|_PersonID|_Address|_manager_kind|_manager nm|_Email|_COMPANY_PK|Birthday|Sex|Tel|Full_FName"   
			    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    aligns="0|0|0|1|1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0"  
			    defaults="|||||||||||||||||||||||||||||||||"  
			    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
			    widths="0|2000|1500|1000|1000|2500|0|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
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

				
