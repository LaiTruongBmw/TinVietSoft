<!-- #include file="../../../../system/lib/form.inc"  -->

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{	
    System.Translate(document);
    txt_Emp_Pk.text     = "<%=session("EMPLOYEE_PK")%>";
    txt_Company_Pk.text ="<%=Request.querystring("company_pk")%>";
    
    lst_TCO_COMPANY_PK.SetEnable(0); 
	BindingDataList();
	
  	
}
function BindingDataList()
{ 
    
    var ls_data      = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>|ALL|Select All";
    lst_TCO_COMPANY_PK.SetDataText(ls_data);  
                        
    lst_TCO_COMPANY_PK.value = txt_Company_Pk.text;
    DSO_Sel_Tree_Dept.Call("SELECT")
}
//-------------------------------------------
function OnSelect()
{   
    var obj = oTreeDept.GetCurrentNode()
    if (obj!=null)
       window.returnValue = obj.oid; 
    else
       window.returnValue = null; 
	window.close();
    
}
//-------------------------------------------
function EXITOnClick()
{
	OnSelect();
}
</script>
<body  bgcolor='#F5F8FF'>

<gw:data id="DSO_Sel_Tree_Dept"   > 
        <xml> 
            <dso id="1" type="tree" function="COMM.SP_SEL_DEPT_TREE" > 
                <input>
                    <input bind="lst_TCO_COMPANY_PK" />
                    <input bind="txt_Emp_Pk" />
                </input> 
                <output bind="oTreeDept" /> 
            </dso> 
        </xml> 
</gw:data>

<!------------------------------->
<table  width="100%"  cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr>
                    <td width="20%" align="left">Company</td>
                    <td width="50%"><gw:list id="lst_TCO_COMPANY_PK" styles='width:100%' onchange=""> 
	                         <data></data> 
                         </gw:list> 
                    </td>
                    <td width="15%" align="right"><gw:imgBtn id="btnSearch" img="search"  alt="search" onclick="OnSearch()" /> </td>
                    <td width="15%" align="right"><gw:imgBtn id="btnSearch" img="select"  alt="Select" onclick="OnSelect()" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
	    <td > 
	        <table cellpadding="0" cellspacing="0" border="0" width="100%" >
                <tr>
                    <td>
	                    <gw:tree  id="oTreeDept" onclicknode="" style="width:100%; height:270;overflow:auto;"  >
		                </gw:tree>  
		           </td>
		       </tr>
		      
		    </table>
	    </td>
    </tr>	
    
</table>
<gw:textbox id="txtDeptPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtUpperDeptPk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txtCountDepId" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txt_Company_Pk" maxlen=100 styles='width:100%;display:none'   csstype=""/>
<gw:textbox id="txt_Emp_Pk" styles="display:none"/>

</body>
</html>
