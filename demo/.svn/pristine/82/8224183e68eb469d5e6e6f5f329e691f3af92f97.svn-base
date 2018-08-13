<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head runat="server">
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
        obj[1]=grdEmployee.GetGridData(irow,2); //emp id
        obj[2]=grdEmployee.GetGridData(irow,3); //full name
        obj[3]=grdEmployee.GetGridData(irow,5); //join date
        obj[4]=grdEmployee.GetGridData(irow,8); //deparment pk
        
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
       /*else if (obj.id=="datGroupData")
       {
            lstGroup.SetDataText(txtGroupData.text);
               
            var obj=lstGroup.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=obj.options.length-1;
       }*/
	   
}     
function OnChangeDept()
{
    //txtDept.text=lstDept_Code.value;
    datGroupData.Call();
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->

<gw:data id="datEmployeePopup"> 
    <xml> 
        <dso  type="grid" function="pm_sel_61030100_3_1"> 
            <input> 
                <input bind="lstDept" /> 
                <input bind="chkTemp" /> 
                <input bind="txtTemp" /> 
                <input bind="lstcomp" /> 
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
					            <td width="10%" align="right">Company &nbsp;</td>
						        <td width="50%" colspan=1><gw:list id="lstcomp" styles="color:black;width:100%" value="ALL" onchange=""> 
	                                           <data><%=ESysLib.SetListDataSQL("SELECT PK,partner_name FROM comm.TCO_company WHERE DEL_IF = 0 ")%>|ALL|Select All</data>
	                                           </gw:list ></td>  
						        
						       
						        <td width="10%" align="right">Search by</td>
						        <td width="12%"><gw:list  id="chkTemp" value="2" styles='width:100%' onchange=""> 
									        <data>LIST|1|Name|2|Emp ID</data> 
							        </gw:list>
						        </td>
        						
						        <td width="15%"><gw:textbox id="txtTemp" onenterkey   ="OnSearch()" styles='width:100%'/></td>
						        
						        <td width="3%" align="left"><gw:imgBtn id="ibtnSearch" alt="Search" img="Search" text="Search" onclick="OnSearch()" /></td>
						        
						        <td width="3%" align="right"><gw:imgBtn id="ibtnExit" alt="Exit" img="Cancel" text="Exit" onclick="OnExit()" /></td>
					        </tr>
					        <tr>   
						        <td width="50%" colspan=2 align="left" valign="middle"><b style="color=#FF00CC; font-size:14">Double click on row to select</b></td>
						        <td width="10%" align="right">Department</td>
						        <td width="40%" colspan=4><gw:list id="lstDept" styles="color:black;width:100%" value="ALL" onchange="OnChangeDept()"> 
	                                           <data><%=ESysLib.SetListDataSQL("SELECT PK,org_NM FROM comm.TCO_org WHERE DEL_IF = 0 order by org_ID, org_NM")%>|ALL|Select All</data>
	                                           </gw:list > 
						        </td>
					        </tr>
				        </table>
			        </td>
		        </tr>
		    </table>
	    </td> 
	</tr>		   
	<tr align = top> 
	    <!--0_PK|1.Department|2.Emp ID|3.Full Name|4.Full LName|5.Join Date|6.PL Unit|7.Company|8_Dept_pk-->
	    <td align = top  width="100%" style="height:93%" >
  		    <gw:grid   
			    id="grdEmployee"  
			    header="_PK|Department|Emp ID|Full Name|Full LName|Join Date|PL Unit|Company|_Dept_pk"   
			    format="0|0|0|0|0|0|0|0|0"  
			    aligns="0|0|1|0|0|1|0|0|0"  
			    defaults="||||||||"  
			    editcol="0|0|0|0|0|0|0|0|0"  
			    widths="0|2000|1100|2000|2000|1500|2000|2000|0"  
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

				
