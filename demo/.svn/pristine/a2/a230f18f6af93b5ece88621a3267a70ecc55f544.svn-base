<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{ 	
    grdEmployee.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
     iduser_pk.text = "<%=session("USER_PK")%>";
     txtHr_level.text= "<%=session("HR_LEVEL")%>";
     <%=CtlLib.SetGridColumnComboFormat( "grdEmployee" , 3 , "select a.code,a.code_nm from vhr_hr_code a where a.id='HR0071' ORDER BY A.seq") %>; 
    
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
        obj[1]=grdEmployee.GetGridData(irow,1); //emp id
        obj[2]=grdEmployee.GetGridData(irow,2); //full name
        obj[3]=grdEmployee.GetGridData(irow,3); //manager level value
        obj[4]=grdEmployee.GetGridData(irow,4); //dept_pk
        obj[5]=grdEmployee.GetGridData(irow,5); //dept_nm
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
            datGroupData.Call();
       } 
       else if (obj.id=="datGroupData")
       {
            lstGroup.SetDataText(txtGroupData.text);
               
            var obj=lstGroup.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=obj.options.length-1;
       }
	   
}     
function OnChangeDept()
{
    //txtDept.text=lstDept_Code.value;
    datGroupData.Call();
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstDept" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datEmployeePopup"> 
    <xml> 
        <dso  type="grid" function="ST_HR_SEL_HRRE00203_0"> 
            <input> 
                <input bind="lstDept" /> 
                <input bind="lstGroup" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
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
					        <tr>   
						        <td width="10%" align="right"><font color="black"><b >Department &nbsp;</b></td>
						        <td width="15%"><gw:list id="lstDept" styles="color:black;width:100%" value="ALL" onchange=""> 
	                                           <data><%=CtlLib.SetListDataSQL("SELECT PK,ORG_NM FROM TCO_ORG WHERE DEL_IF = 0 AND ORG_TYPE='06' order by ORG_ID")%>|ALL|Select All</data>
	                                           </gw:list > 
						        </td>
						        <td width="7%" align="right"><font color="black"><b >WGroup &nbsp;</b></td>
						        <td width="15%"><gw:list id="lstGroup" styles="color:black;width:100%" value="ALL" onchange=""> 
	                                            <data><%=CtlLib.SetListDataSQL("SELECT PK,WORKGroup_NM FROM Thr_WORK_Group WHERE DEL_IF = 0 order by WORKGroup_ID" )%>|ALL|Select All</data>
	                                            </gw:list > 
						        </td>
						        <td width="10%" align="right"><font color="black"><b>Search by &nbsp;</b>
						        </td>
						        <td width="8%">
							        <gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID|3|Card ID|4|Per ID</data> 
							        </gw:list>
						        </td>
        						
						        <td width="15%"> 
							        <gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/>
						        </td>
						        <td width="2%" ></td>
						        <td width="3%" align="left">
							        <gw:imgBtn id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" />
						        </td>
						        <td width="2%" ></td>
						        <td width="3%" align="right">
							       <gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" />
						        </td>
					        </tr>
					        <tr>   
						        <td width="100%" colspan=11 align="left" valign="middle"><font color="black"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
					        </tr>
				        </table>
			        </td>
		        </tr>
		    </table>
	    </td> 
	</tr>		   
	<tr align = top> 
	    <td align = top  width="100%" style="height:93%" >
  		    <gw:grid   
			    id="grdEmployee"  
			    header="_EMP_PK|EMP ID|FULL NAME|MANAGER LEVEL|_DEPT_PK|ORGANIZATION"   
			    format="0|0|0|0|0|0"  
			    aligns="0|0|0|1|1|0"  
			    defaults="|||||"  
			    editcol="0|0|0|0|0|0"  
			    widths="0|1500|3000|1500|1500|3000"  
			    styles="width:100%; height:100%"   
			    sorting="T"   
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

				
